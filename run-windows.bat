@echo off
REM Double-click to build & run Windows debug build.
setlocal enableextensions
cd /d "%~dp0"
set "HAXELIB_PATH=%CD%\.haxelib"
if not exist "%HAXELIB_PATH%" (
    echo [!] .haxelib not found. Run setup\setup.bat first.
    pause
    exit /b 1
)
lime test windows
pause
exit /b %errorlevel%
