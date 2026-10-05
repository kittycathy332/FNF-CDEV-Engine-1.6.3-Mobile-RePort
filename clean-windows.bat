@echo off
REM Double-click to clean export/ and intermediate build files.
setlocal enableextensions
cd /d "%~dp0"
set "HAXELIB_PATH=%CD%\.haxelib"
if not exist "%HAXELIB_PATH%" (
    echo [!] .haxelib not found. Run setup\setup.bat first.
    pause
    exit /b 1
)
lime clean windows
pause
exit /b %errorlevel%
