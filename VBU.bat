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
set "userinput="
set /p "userinput="
for %%i in (%userinput%) do (
set syntax=%%i
goto syntax
)
:syntax
>nul find "%syntax%" commandsyntax.txt && (
call :%userinput%
goto :menu
) || (
set appm=SyntaxError
title %appn% v%appv% - %appm%
echo "%syntax%" is not a valid command.
pause
goto :menu
)
pause
exit
:readline
set "file=%1"
set "line=%2"
set "output="
set /a s=%line% - 1
for /F "skip=%s% delims=" %%i in (%file%) do if not defined %output% set "output=%%i"
exit /b
:download
powershell -Command "(New-Object Net.WebClient).DownloadFile('%1', '%2')"
exit /b
:update
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/baikil/VBU/main/VBU.bat', 'VBU.bat')"
start VBU.bat
exit
:echo
echo %1 %2 %3 %4 %5 %6 %7 %8 %9
pause
exit /b
:setvar
set "var=%1"
set "val=%2"
set %var%=%val%
exit /b
:openfile
start %1
exit /b
:pluginlist
echo Installed plugins:
type installedplugins.vbuf
echo.
echo Avalable plugins:
echo ConfigHighSierra
echo ConfigBigSur
echo.
:plconfirm
set /p "userinput=Do you want to install a plugin? [y/n]"
if /I "%userinput%" EQU "y" goto installplugin
if /I "%userinput%" EQU "n" goto menu
goto plconfirm
exit /b
:installplugin
echo Type the name of the plugin that you want to install (Caps matters)
set /p "userinput="
call :download %rawurl%%userinput%.bat %userinput%.bat
goto home
exit /b