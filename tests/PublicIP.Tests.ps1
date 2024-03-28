[CmdletBinding()]
Param(
    # Path to the module to test.
    [Parameter()]
    [string] $Path
)

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
}
