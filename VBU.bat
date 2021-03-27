:reset
@echo off
cls
set "appn=VirtualBox Utilities"
set "appv=0"
set "appm=Verification"
title %appn% v%appv% - %appv%

:verif1
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/baikil/VBU/main/version.vbuf', 'version.vbuf')"
for /f "tokens=*" %%A in (version.vbuf) do (set "version=%%A")
if not %appv%==%version% goto update

:verif2
if exist settings.vbuf goto menu
echo Choose language / Choisir la langue
echo EN=English   FR=Francais
echo.
set /p lang=
echo %lang%>settings.vbuf

:menu
type settings.vbuf
pause
exit

:download
powershell -Command "(New-Object Net.WebClient).DownloadFile('%1', '%2')"

:update
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/baikil/VBU/main/VBU.bat', 'VBU.bat')"
start VBU.bat
exit