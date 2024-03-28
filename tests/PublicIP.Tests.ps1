[CmdletBinding()]
Param(
    # Path to the module to test.
    [Parameter()]
    [string] $Path
)

Write-Verbose "Path to the module: [$Path]" -Verbose

Describe 'PublicIP' {
    Context 'Module' {
        It 'The module should be available' {
            Get-Module -Name 'PublicIP' -ListAvailable | Should -Not -BeNullOrEmpty
            Write-Verbose (Get-Module -Name 'PublicIP' -ListAvailable | Out-String) -Verbose
        }
        It 'The module should be imported' {
            { Import-Module -Name 'PublicIP' -Verbose -RequiredVersion 999.0.0 -Force } | Should -Not -Throw
        }
    }

    Context 'Get-PublicIP' {
        It 'Should return the public IP address' {
            $PublicIP = Get-PublicIP
            $PublicIP | Should -Not -BeNullOrEmpty
            Write-Verbose $PublicIP -Verbose
        }

        It 'Should return the public IP address from MyIP' {
            $PublicIP = Get-PublicIP -Provider MyIP
            $PublicIP | Should -Not -BeNullOrEmpty
            Write-Verbose $PublicIP -Verbose
        }
    }
}
