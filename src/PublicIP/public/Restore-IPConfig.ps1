function Restore-IPConfig {
    <#
        .SYNOPSIS
        Restores the IPConfig from the file.

        .DESCRIPTION
        Restores the IPConfig from the file.

        .EXAMPLE
        Restore-IPConfig
    #>
    if (Test-Path -Path $IPConfigFilePath) {
        return Get-Content -Path $IPConfigFilePath | ConvertFrom-Json
    }
}
