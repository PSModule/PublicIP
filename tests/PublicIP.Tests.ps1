#Requires -Modules @{ ModuleName = 'Pester'; ModuleVersion = '6.0.0'; MaximumVersion = '6.*'; GUID = 'a699dea5-2c73-4616-a270-1f7abb777e71' }

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
