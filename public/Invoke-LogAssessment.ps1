function Invoke-LogAssessment {
    <#
    .SYNOPSIS
        Submit a log file for analysis
    .DESCRIPTION
        Submit a log file for analysis to the PSAI assistant. The assistant will provide a response based on the instructions and prompt provided.
    .PARAMETER Path
        The path to the log file to be analyzed.
    .PARAMETER Instructions
        Instructions to be provided to the assistant. Default is "check the logs - output json".
    .PARAMETER Question
        The question to be provided to the assistant. Default is "show 5 key error messages, look at the first 100".
    .EXAMPLE
        Invoke-LogAssessment -Path "/var/log/syslog"
        Returns the response from the assistant based on the log file analysis using the default instructions and prompt.
    .EXAMPLE
        Invoke-LogAssessment -Path "~/.xsession_errors" -Instructions "check the logs - output markdown table" -Question "the cinnamon desktop crashed a few hours ago. show 5 key error messages, look at the first 100"
        Returns the response from the assistant based on the log file analysis using the specified instructions and prompt.
    .OUTPUTS
        STRING - The response from the assistant based on the log file analysis.
    #>
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$True)][string]$Path,
        [parameter(Mandatory=$False)][string]$Instructions = "check the logs - output json",
        [parameter(Mandatory=$False)][string]$Question = "show 5 key error messages, look at the first 100"
    )
    if (-not (Get-Module -Name PSAI -ListAvailable)) {
        Write-Warning "This command requires the PSAI module"
        return
    }
    if (Test-Path -Path $Path) {
        $global:LogFilePath = $Path
        Write-Verbose "Submitting request to assistant"
        $inst = "date: $(Get-Date) - $instructions"
        $assistant = New-Agent -Tools Get-LogFile -Instructions $inst -ShowToolCalls
        $assistant | Get-AgentResponse -Prompt $Question
    } else {
        Write-Warning "Log file not found: $Path"
    }
}
