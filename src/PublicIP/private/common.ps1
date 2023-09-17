$script:providerMap = @{
    MyIP   = 'https://api.myip.com/'
    IPInfo = 'https://ipinfo.io/json'
}

$script:IPConfigFilePath = "$([Environment]::GetFolderPath('MyDocuments'))\IPConfig.json"
