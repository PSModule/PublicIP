function Save-IPConfig {
    <#
        .SYNOPSIS
        Saves the current public ip to a file.

        .DESCRIPTION
        Saves the current public ip to a file.
        If the file does not exist, it will be created.

        .EXAMPLE
        Save-IPConfig
    #>
    $IPConfig = @()
    $RestoredIPConfig = Restore-IPConfig
    if ($null -ne $RestoredIPConfig) {
        $IPConfig += $RestoredIPConfig
    }
    $CurrentIPConfig = Get-IPConfig

    # Check if recent and current ip is the same
    if ($IPConfig[-1].PublicIP -eq $CurrentIPConfig.PublicIP) {

    } else {
        "Public IP has changed since $($IPConfig[-1].Time)"
        "Old PIP: $($IPConfig[-1].PublicIP)"
        "New PIP: $($CurrentIPConfig.PublicIP)"
        $IPConfig += $CurrentIPConfig

        if (-not (Test-Path -Path $IPConfigFilePath)) {
            New-Item -Path $IPConfigFilePath -Force | Out-Null
        }

        $IPConfig | ConvertTo-Json -AsArray | Set-Content -Path $IPConfigFilePath -Force
    }
}
