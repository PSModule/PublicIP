# Fonts

This is a PowerShell module for getting information about your public IP.
It uses the APIs of [IPInfo](https://ipinfo.io) and [MyIP](https://www.myip.com/) to get this data.

## Prerequisites

This module requires an internet connection to work.

## Installation

To install the module simply run the following command in a PowerShell terminal.

```powershell
Install-PSResource -Name PublicIP
Import-Module -Name PublicIP
```

## Usage

You can use this module to get info about your public IP.

### List information about your public IP and ISP

This command will information about your public IP and more information about your ISP.

```powershell
Get-PublicIP
```

### List public IP using 'MyIP' API

This command will get your public IP using the 'MyIP' API.

```powershell
Get-PublicIP -Provider MyIP
```

## Contributing

Coder or not, you can contribute to the project! We welcome all contributions.

### For Users

If you don't code, you still sit on valuable information that can make this project even better. If you experience that the
product does unexpected things, throw errors or is missing functionality, you can help by submitting bugs and feature requests.
Please see the issues tab on this project and submit a new issue that matches your needs.

### For Developers

If you do code, we'd love to have your contributions. Please read the [Contribution guidelines](CONTRIBUTING.md) for more information.
You can either help by picking up an existing issue or submit a new one if you have an idea for a new feature or improvement.
