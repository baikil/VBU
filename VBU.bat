:reset
@echo off
cls
set "appn=VirtualBox Utilities"
set "appv=0.2"
set "appm=Verification"
set "rawurl=https://raw.githubusercontent.com/baikil/VBU/main/"
title %appn% v%appv% - %appm%
:verif1
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/baikil/VBU/main/version.vbuf', 'version.vbuf')"
for /f "tokens=*" %%A in (version.vbuf) do (set "version=%%A")
if not %appv% geq %version% goto update
del version.vbuf
:verif2
if exist settings.vbuf goto menu
echo Choose language / Choisir la langue
echo EN=English   FR=Francais
echo.
set /p lang=
echo %lang%>settings.vbuf
call :download lien%lang% lang.vbuf 
:menu
cls
set "appm=Menu"
title %appn% v%appv% - %appm%
echo [46;93m:::     ::: :::::::::  :::    ::: 
echo :+:     :+: :+:    :+: :+:    :+: 
echo +:+     +:+ +:+    +:+ +:+    +:+ 
echo +#+     +:+ +#++:++#+  +#+    +:+ 
echo  +#+   +#+  +#+    +#+ +#+    +#+ 
echo   #+#+#+#   #+#    #+# #+#    #+# 
echo [4m    ###     #########   ########  [0m
echo.
echo [30;103mVirtualBox Utilities v%appv%         [0m
echo.
set /p "input="
pause
exit
:readline
set "file=%1"
set "line=%2"
set "variable=%3"
set "%variable%="
set /a s = %line% - 1
for /F "skip=%s% delims=" %%i in (%file%) do if not defined %variable% set "%variable%=%%i"
exit /b
:download
powershell -Command "(New-Object Net.WebClient).DownloadFile('%1', '%2')"
exit /b
:update
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/baikil/VBU/main/VBU.bat', 'VBU.bat')"
start VBU.bat
exit