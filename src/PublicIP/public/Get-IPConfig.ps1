function Get-IPConfig {
    <#
        .SYNOPSIS
        Gets the current IP configuration.

        .DESCRIPTION
        Gets the current IP configuration.

        .EXAMPLE
        Get-IPConfig
    #>

    $PublicIP = Get-PublicIP
    $Time = Get-Date -Format yyyyMMdd-hhmmss.fffff
    $Location = Get-GeoLocation
    $LocalIPConfig = Get-NetIPAddress -AddressFamily IPv4 -Type Unicast | Where-Object PrefixOrigin -Match dhcp
    $IPObj = [ordered]@{
        PublicIP  = $PublicIP.IP
        PrivateIP = $LocalIPConfig.IPv4Address
        PCName    = $ENV:COMPUTERNAME
        Time      = $Time
        Latitude  = $Location.Latitude
        Longitude = $Location.Longitude
    }
    return $IPObj
}
