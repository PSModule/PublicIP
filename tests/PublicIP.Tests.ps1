[CmdletBinding()]
Param(
    # Path to the module to test.
    [Parameter()]
    [string] $Path
)

Write-Verbose "Path to the module: [$Path]" -Verbose

Describe 'PublicIP' {
    Context 'Get-PublicIP' {
        It 'Should return the public IP address' {
            $PublicIP = Get-PublicIP
            $PublicIP | Should -Not -BeNullOrEmpty
            Write-Verbose ($PublicIP | Out-String) -Verbose
        }

        It 'Should return the public IP address from MyIP' {
            $PublicIP = Get-PublicIP -Provider MyIP
            $PublicIP | Should -Not -BeNullOrEmpty
            Write-Verbose ($PublicIP | Out-String) -Verbose
        }
    }
}
