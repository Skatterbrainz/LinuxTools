---
document type: cmdlet
external help file: linuxtools-Help.xml
HelpUri: https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-Certificates.md
Locale: en-US
Module Name: linuxtools
ms.date: 09/27/2025
PlatyPS schema version: 2024-05-01
title: Get-Certificates
---

# Get-Certificates

## SYNOPSIS

Collects information about installed certificates.

## SYNTAX

### __AllParameterSets

```
Get-Certificates [[-CertPath] <string>] [-Detailed] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

This function retrieves details about installed certificates, including their subject, issuer, and expiration dates.

## EXAMPLES

### EXAMPLE 1

Get-Certificates | Select-Object CommonName, ExpiryDate, DaysUntilExpiry
This example retrieves certificates and selects specific properties for display.

### EXAMPLE 2

Get-Certificates -Detailed | Where-Object { $_.DaysUntilExpiry -lt 365 }
This example retrieves detailed information about certificates that are expiring within the next year.

### EXAMPLE 3

Get-Certificates | Where-Object IsExpired | Select-Object CommonName, ExpiryDate
This example retrieves certificates that have already expired and selects their common names and expiration dates.

## PARAMETERS

### -CertPath

The path to the directory containing the certificate files (default: /etc/ssl/certs).

```yaml
Type: System.String
DefaultValue: /etc/ssl/certs
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Detailed

Whether to include detailed information about each certificate.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

- [](https://github.com/Skatterbrainz/linuxtools/blob/master/docs/Get-Certificates.md)
