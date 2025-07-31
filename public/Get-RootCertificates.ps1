function Get-RootCertificates {
	<#
	.SYNOPSIS
		Gets information about root certificates in the specified directory.

	.DESCRIPTION
		This function retrieves details about root certificates, including their subject, issuer, and expiration dates.

	.PARAMETER CertPath
		The path to the directory containing the certificate files (default: /etc/ssl/certs).

	.PARAMETER Detailed
		Whether to include detailed information about each certificate.
	.EXAMPLE
		Get-RootCertificates | Select-Object CommonName, ExpiryDate, DaysUntilExpiry
		This example retrieves root certificates and selects specific properties for display.
	.EXAMPLE
		Get-RootCertificates -Detailed | Where-Object { $_.DaysUntilExpiry -lt 365 }
		This example retrieves detailed information about root certificates that are expiring within the next year.
	.EXAMPLE
		Get-RootCertificates | Where-Object IsExpired | Select-Object CommonName, ExpiryDate
		This example retrieves root certificates that have already expired and selects their common names and expiration dates.
	.LINK
		https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-RootCertificates.md
	#>
	[CmdletBinding()]
	param(
		[string]$CertPath = "/etc/ssl/certs",
		[switch]$Detailed
	)
	
	$certFiles = Get-ChildItem -Path $CertPath -Filter "*.pem"
	$results = @()
	
	foreach ($certFile in $certFiles) {
		try {
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
					$expiryDate = (Get-Date $dateStr).ToString("MMM d HH:mm:ss yyyy")
					#$expiryDate = [DateTime]::ParseExact($expiryDate, 'MMM d HH:mm:ss yyyy', $null)
				}
			}
			$daysUntilExpiry = ($expiryDate - (Get-Date)).Days
			
			$certInfo = [PSCustomObject]@{
				FileName          = $certFile.Name
				CommonName        = $cn
				Subject           = $subject
				Issuer            = $issuer
				StartDate         = $startDate
				EndDate           = $endDate
				ExpiryDate        = $expiryDate
				DaysUntilExpiry   = $daysUntilExpiry
				SerialNumber      = $serial
				SHA256Fingerprint = $fingerprint
				IsExpired         = $daysUntilExpiry -lt 0
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
			}
			
			$results += $certInfo
		}
		catch {
			Write-Warning "Failed to process $($certFile.Name): $($_.Exception.Message)"
		}
	}
	
	# Summary
	Write-Host "`nRoot Certificate Summary:" -ForegroundColor Green
	Write-Host "Total certificates: $($results.Count)" -ForegroundColor Cyan
	Write-Host "Expired certificates: $($results | Where-Object IsExpired | Measure-Object | Select-Object -ExpandProperty Count)" -ForegroundColor Red
	Write-Host "Expiring within 30 days: $($results | Where-Object { $_.DaysUntilExpiry -lt 30 -and -not $_.IsExpired } | Measure-Object | Select-Object -ExpandProperty Count)" -ForegroundColor Yellow
	
	return $results | Sort-Object CommonName
}

# Usage examples:
# Get-RootCertificates | Select-Object CommonName, ExpiryDate, DaysUntilExpiry | Format-Table
# Get-RootCertificates -Detailed | Where-Object { $_.DaysUntilExpiry -lt 365 } | Format-Table
# Get-RootCertificates | Where-Object IsExpired | Select-Object CommonName, ExpiryDate
