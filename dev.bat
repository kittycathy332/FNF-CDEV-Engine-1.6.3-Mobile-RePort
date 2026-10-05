@echo off
REM ============================================================
REM  Run lime using THIS project's isolated .haxelib folder.
REM  No global haxelib is touched. Close the window and you're back
REM  to whatever other project's environment you were in.
REM
REM  Usage:
REM    dev.bat                          -> show this help
REM    dev.bat test windows             -> lime test windows
REM    dev.bat build windows -debug     -> lime build windows -debug
REM    dev.bat test android             -> lime test android
REM    dev.bat rebuild ...              -> any other lime args
REM ============================================================
setlocal enableextensions
cd /d "%~dp0"

set "HAXELIB_PATH=%CD%\.haxelib"

if not exist "%HAXELIB_PATH%" (
    echo [!] .haxelib not found at:
    echo     %HAXELIB_PATH%
    echo.
    echo     Run setup\setup.bat first to install project-local deps.
    exit /b 1
)

if "%~1"=="" (
    echo Isolated haxelib: %HAXELIB_PATH%
    echo.
    echo Usage:
    echo   dev.bat ^<lime command^>
    echo.
    echo Examples:
    echo   dev.bat test windows
    echo   dev.bat build windows -debug
    echo   dev.bat test android
    echo.
    exit /b 0
)

lime %*
exit /b %errorlevel%
