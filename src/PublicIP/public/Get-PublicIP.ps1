function Get-PublicIP {
    param(
        [Parameter(Mandatory = $false)]
        [ValidateScript({ $providerMap.Keys })]
        $Provider = 'IPInfo'
    )

    Invoke-RestMethod -Uri $providerMap[$Provider]
}
