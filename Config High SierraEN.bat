@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
title MacOS VM Setup - High Sierra - Ready
echo [41m[93mCAUTION[0m
echo [97mThis automated settings configurator only works with mac OS High Sierra[0m
pause
cls
echo [97mName of the Mac OS VM[0m
set /p "vm="
title MacOS VM Setup - High Sierra - Configuration
cd "C:\Program Files\Oracle\VirtualBox"
VBoxManage.exe modifyvm "%vm%" --cpuidset 00000001 000306a9 04100800 7fbae3ff bfebfbff
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "MacBookPro11,3"
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Mac-2BD1B31983FE1663"
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
if errorlevel==1 goto error
title MacOS VM Setup - High Sierra - Setup Completed
cls
echo [92mSetup Completed[0m
timeout 5
exit
:error
color c
echo.
echo.
echo                [An error occured]
echo Verify if the os version is High Sierra (10.13) or
echo if the VM name [%vm%] is correct (Caps matters)
echo.
echo.
pause
exit