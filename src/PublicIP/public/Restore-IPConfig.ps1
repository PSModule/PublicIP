function Restore-IPConfig {
    if (Test-Path -Path $IPConfigFilePath) {
        return Get-Content -Path $IPConfigFilePath | ConvertFrom-Json
    }
}
