@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
title MacOS VM Setup - High Sierra - Ready
echo [41m[93mCAUTION[0m
echo [97mThis automated settings configurator only works with mac OS Big Sur[0m
pause
cls
echo [97mName of the Mac OS VM[0m
set /p "vm="
title MacOS VM Setup - Big Sur - Configuration
cd "C:\Program Files\Oracle\VirtualBox\"
VBoxManage.exe modifyvm "%vm%" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac19,1"
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Mac-AA95B1DDAB278B95"
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
if errorlevel==1 goto error
title MacOS VM Setup - Big Sur - Setup Completed
cls
echo [92mSetup Completed[0m
timeout 5
exit
:error
color c
echo.
echo.
echo                [An error occured]
echo Verify if the os version is Big Sur (11) or
echo if the VM name [%vm%] is correct (Caps matters)
echo.
echo.
pause
exit