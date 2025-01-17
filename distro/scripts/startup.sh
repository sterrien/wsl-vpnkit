#! /bin/sh

LOG_PATH="/var/log/wsl-vpnkit.log"
USERPROFILE=$(wslpath "$(powershell.exe -c 'Write-Host -NoNewline $env:USERPROFILE')")
VERSION="$(cat /app/version)"

touch $LOG_PATH

echo "
wsl-vpnkit $VERSION
This distro is only intended for running wsl-vpnkit. 

Run the following commands from Windows or other WSL 2 distros to use.

    wsl.exe -d $WSL_DISTRO_NAME service wsl-vpnkit start
    wsl.exe -d $WSL_DISTRO_NAME service wsl-vpnkit stop

The following files will be copied if they do not already exist.

    $USERPROFILE/wsl-vpnkit/wsl-vpnkit.exe
    $USERPROFILE/wsl-vpnkit/npiperelay.exe

Logs for wsl-vpnkit can be viewed here.

    wsl.exe -d $WSL_DISTRO_NAME tail -f $LOG_PATH

Config for wsl-vpnkit can be edited here. See the wsl-vpnkit script for possible values.

    $USERPROFILE/wsl-vpnkit/wsl-vpnkit.conf
    wsl.exe -d $WSL_DISTRO_NAME cat /usr/sbin/wsl-vpnkit

Press [enter] key to continue...
"
read _
exit 0
