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
	$results = @(Get-Certificates -CertPath $CertPath -CertFilter '*.pem' -Detailed:$Detailed -Quiet |
		ForEach-Object {
			[pscustomobject]@{
				FileName          = if ($_.Path) { Split-Path -Path $_.Path -Leaf } else { $null }
				CommonName        = $_.CommonName
				Subject           = $_.Subject
				Issuer            = $_.Issuer
				StartDate         = $_.StartDate
				EndDate           = $_.ExpiryDate
				ExpiryDate        = $_.ExpiryDate
				DaysUntilExpiry   = $_.DaysUntilExpiry
				SerialNumber      = $_.SerialNumber
				SHA256Fingerprint = $_.Fingerprint
				IsExpired         = $_.IsExpired
				SignatureAlgorithm = $_.SignatureAlgorithm
				PublicKeyAlgorithm = $_.PublicKeyAlgorithm
				KeySize           = $_.KeySize
			}
		})
	Write-Host "`nRoot Certificate Summary:" -ForegroundColor Green
	Write-Host "Total certificates: $($results.Count)" -ForegroundColor Cyan
	Write-Host "Expired certificates: $($results | Where-Object IsExpired | Measure-Object | Select-Object -ExpandProperty Count)" -ForegroundColor Red
	Write-Host "Expiring within 30 days: $($results | Where-Object { $_.DaysUntilExpiry -lt 30 -and -not $_.IsExpired } | Measure-Object | Select-Object -ExpandProperty Count)" -ForegroundColor Yellow
	$results | Sort-Object CommonName
}

# Usage examples:
# Get-RootCertificates | Select-Object CommonName, ExpiryDate, DaysUntilExpiry | Format-Table
# Get-RootCertificates -Detailed | Where-Object { $_.DaysUntilExpiry -lt 365 } | Format-Table
# Get-RootCertificates | Where-Object IsExpired | Select-Object CommonName, ExpiryDate
