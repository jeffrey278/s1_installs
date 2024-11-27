function install-sentinel(){

    #Github repo
    echo "downloading installer"
    $exeUrl = "https://github.com/jeffrey278/s1_installs/releases/download/S1/Sentinelinstall.exe"


    $exePath = "$env:TEMP\SentinelInstaller.exe"

    Invoke-WebRequest -Uri $exeUrl -OutFile $exePath

    $groupToken = "eyJ1cmwiOiAiaHR0cHM6Ly9ldWNlMS0xMjAtbXNzcC5zZW50aW5lbG9uZS5uZXQiLCAic2l0ZV9rZXkiOiAiZ180NWRiNDM0MWQ2MmNlZTg0In0="

    # Run the EXE file with arguments

    Echo "SentinelOne Installer running do not close this window"
    Start-Process -FilePath $exePath -ArgumentList "-t $groupToken -q" -Wait
}

# Search control panel installed software
$S1 = Get-WmiObject -Class Win32_Product | sort-object Name | select Name | where { $_.Name -eq "Sentinel Agent"}

if($S1 -match "Sentinel Agent"){

    echo "Sentinel Is already installed"


}else{
    install-sentinel

}
