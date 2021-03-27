@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
title MacOS VM Config - High Sierra - Pret
echo [41m[93mATTENTION[0m
echo [97mCe configurateur de parametres automatise fonctionne uniquement avec mac OS High Sierra[0m
pause
cls
echo [97mNom de la machine virtuelle Mac OS[0m
set /p "vm="
title MacOS VM Config - High Sierra - Configuration
cd "C:\Program Files\Oracle\VirtualBox"
VBoxManage.exe modifyvm "%vm%" --cpuidset 00000001 000306a9 04100800 7fbae3ff bfebfbff
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "MacBookPro11,3"
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Mac-2BD1B31983FE1663"
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
if errorlevel==1 goto error
title MacOS VM Config - High Sierra - Configuration terminee
cls
echo [92mConfiguration terminée[0m
timeout 5
exit
:error
color c
echo.
echo.
echo                  [Une erreur s'est produite.]
echo Verifiez si la version mac OS est High Sierra (10.13) ou
echo si le nom de la machine virtuelle [%vm%] est correct (les majuscules comptent)
echo.
echo.
pause
exit