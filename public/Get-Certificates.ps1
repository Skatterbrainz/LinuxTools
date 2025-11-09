function Get-Certificates {
	<#
	.SYNOPSIS
		Collects information about installed certificates.
	.DESCRIPTION
		This function retrieves details about installed certificates, including their subject, issuer, and expiration dates.
	.PARAMETER CertPath
		The path to the directory containing the certificate files (default: /etc/ssl/certs).
	.PARAMETER CertFilter
		The file filter to identify certificate files (default: *.pem).
	.PARAMETER Detailed
		Whether to include detailed information about each certificate.
	.EXAMPLE
		Get-Certificates | Select-Object CommonName, ExpiryDate, DaysUntilExpiry
		This example retrieves certificates and selects specific properties for display.
	.EXAMPLE
		Get-Certificates -Detailed | Where-Object { $_.DaysUntilExpiry -lt 365 }
		This example retrieves detailed information about certificates that are expiring within the next year.
	.EXAMPLE
		Get-Certificates | Where-Object IsExpired | Select-Object CommonName, ExpiryDate
		This example retrieves certificates that have already expired and selects their common names and expiration dates.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-Certificates.md
	#>
	[CmdletBinding()]
	param(
		[parameter(Mandatory=$false)][string]$CertPath = "/etc/ssl/certs",
		[parameter(Mandatory=$false)][string]$CertFilter = "*.pem",
		[parameter(Mandatory=$false)][switch]$Detailed
	)
	try {
		[array]$certFiles = Get-ChildItem -Path $CertPath -Filter $CertFilter
		Write-Host "$($certFiles.Count) certificate files found in $CertPath" -ForegroundColor Green
		$results = @()
		foreach ($certFile in $certFiles) {
			Write-Verbose "Processing certificate: $($certFile.FullName)"
			try {
				# Initialize variables with default values
				$cn = "N/A"
				$subject = ""
				$issuer = ""
				$startDate = ""
				$endDate = ""
				$expiryDate = $null
				$daysUntilExpiry = 0
				$serial = ""
				$fingerprint = ""

				# Basic certificate info
				$subject     = (openssl x509 -noout -subject -in $certFile.FullName) -replace "subject=", ""
				$issuer      = (openssl x509 -noout -issuer -in $certFile.FullName) -replace "issuer=", ""
				$startDate   = (openssl x509 -noout -startdate -in $certFile.FullName) -replace "notBefore=", ""
				$endDate     = (openssl x509 -noout -enddate -in $certFile.FullName) -replace "notAfter=", ""
				$serial      = (openssl x509 -noout -serial -in $certFile.FullName) -replace "serial=", ""
				$fingerprint = (openssl x509 -noout -fingerprint -sha256 -in $certFile.FullName) -replace "SHA256 Fingerprint=", ""

				# Extract CN from subject
				$cn = if ($subject -match "CN\s*=\s*([^,]+)") { $matches[1].Trim() } else { "N/A" }

				# Parse expiration date (handle different formats)
				try {
					$dateStr = $($endDate.Split(' ')[0..3] -join ' ') -replace '  ', ' '
					Write-Verbose "Parsing date with format: $dateStr"
					$expiryDate = [DateTime]::ParseExact($dateStr, 'MMM dd HH:mm:ss yyyy', $null)
				} catch {
					# Try alternative format for single-digit days
					$dateStr = $($endDate.Split(' ')[0..2] + $endDate.Split(' ')[4] -join ' ') -replace '  ', ' '
					Write-Verbose "Parsing date with alternative format: $dateStr"
					try {
						$expiryDate = [DateTime]::ParseExact($dateStr, 'MMM d HH:mm:ss yyyy', $null)
					} catch {
						Write-Verbose "Parsing date with 2nd fallback format: $dateStr"
						try {
							$expiryDate = Get-Date $dateStr
						} catch {
							Write-Verbose "Failed to parse date, using current date"
							$expiryDate = Get-Date
						}
					}
				}
				$daysUntilExpiry = ($expiryDate - (Get-Date)).Days

				# Create result object
				$certInfo = [PSCustomObject]@{
					CommonName       = $cn
					Subject          = $subject
					Issuer           = $issuer
					StartDate        = $startDate
					ExpiryDate       = $expiryDate
					DaysUntilExpiry  = $daysUntilExpiry
					IsExpired        = $daysUntilExpiry -lt 0
					SerialNumber     = $serial
					Fingerprint      = $fingerprint
				}

				if ($Detailed) {
					# Get additional details
					$textOutput = openssl x509 -noout -text -in $certFile.FullName
					$sigAlgo    = ($textOutput | Select-String "Signature Algorithm:").Line.Split(':')[1].Trim()
					$pubKeyAlgo = ($textOutput | Select-String "Public Key Algorithm:").Line.Split(':')[1].Trim()
					$keySize    = if ($textOutput -match "Public-Key: \((\d+) bit\)") { $matches[1] } else { "Unknown" }

					$certInfo | Add-Member -NotePropertyName SignatureAlgorithm -NotePropertyValue $sigAlgo
					$certInfo | Add-Member -NotePropertyName PublicKeyAlgorithm -NotePropertyValue $pubKeyAlgo
					$certInfo | Add-Member -NotePropertyName KeySize -NotePropertyValue $keySize
					$certInfo | Add-Member -NotePropertyName Path -NotePropertyValue $certFile.FullName
				}

				$results += $certInfo
			} catch {
				Write-Verbose "Error processing certificate $($certFile.FullName): $_"
			}
		}
		return $results

	} catch {
		Write-Error "Failed to retrieve certificate information: $($_.Exception.Message)"
	}
}