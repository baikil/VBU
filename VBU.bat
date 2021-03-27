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
del version.vbuf

:verif2
if exist settings.vbuf goto menu
echo Choose language / Choisir la langue
echo EN=English   FR=Francais
echo.
set /p lang=
echo %lang%>settings.vbuf

:menu
cls
type settings.vbuf
call :readline test.txt 3
echo %output%
pause
exit

:readline
set "file=%1"
set "line=%2"

set "output="
set /a skip = %line% - 1
for /F "skip=2 delims=" %%i in (%file%) do if not defined output set "output=%%i"
exit /b

:download
powershell -Command "(New-Object Net.WebClient).DownloadFile('%1', '%2')"
exit /b

:update
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/baikil/VBU/main/VBU.bat', 'VBU.bat')"
start VBU.bat
exit