function Get-GeoLocation {
    <#
        .SYNOPSIS
        Gets the current location of the device.

        .DESCRIPTION
        Gets the current location of the device.

        .EXAMPLE
        Get-GeoLocation
    #>

    Add-Type -AssemblyName System.Device #Required to access System.Device.Location namespace
    $GeoWatcher = New-Object System.Device.Location.GeoCoordinateWatcher #Create the required object
    $GeoWatcher.Start() #Begin resolving current locaton

    while (($GeoWatcher.Status -ne 'Ready') -and ($GeoWatcher.Permission -ne 'Denied')) {
        Start-Sleep -Milliseconds 100 #Wait for discovery.
    }
    if ($GeoWatcher.Permission -eq 'Denied') {
        Write-Error 'Access Denied for Location Information'
    } else {
        $Location = $GeoWatcher.Position.Location | Select-Object Latitude, Longitude #Select the relevent results.
    }
    $GeoWatcher.Stop()
    return $Location
}
