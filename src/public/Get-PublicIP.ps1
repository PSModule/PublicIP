function Get-PublicIP {
    <#
        .SYNOPSIS
        Gets your public IP address.

        .DESCRIPTION
        Gets your public IP address. You can specify a provider to use by using the Provider parameter.

        .EXAMPLE
        Get-PublicIP

        .EXAMPLE
        Get-PublicIP -Provider MyIP
    #>
    param(
        # The provider to use to get the public IP address.
        [Parameter()]
        [ValidateScript({ $providerMap.Keys })]
        $Provider = 'IPInfo'
    )

    Invoke-RestMethod -Uri $providerMap[$Provider]
}
