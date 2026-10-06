@echo off
REM ============================================================
REM  Isolated project-local haxelib setup for Windows.
REM  All deps go into .\.haxelib\ inside THIS project only.
REM  Does NOT run "haxelib setup", does NOT touch global config.
REM
REM  Prereqs: haxe + haxelib on PATH, git on PATH.
REM ============================================================
setlocal enableextensions

cd /d "%~dp0.."

set "HAXELIB_PATH=%CD%\.haxelib"
if not exist "%HAXELIB_PATH%" mkdir "%HAXELIB_PATH%"

echo.
echo ============================================================
echo  Project haxelib: %HAXELIB_PATH%
echo  (isolated, global ~/haxelib will NOT be touched)
echo ============================================================
echo.

echo [ 1/11] flixel 5.9.0 ...
haxelib install flixel 5.9.0 --quiet
if errorlevel 1 goto :error

echo [ 2/11] flixel-addons 3.2.2 ...
haxelib install flixel-addons 3.2.2 --quiet
if errorlevel 1 goto :error

echo [ 3/11] flixel-ui 2.4.0 ...
haxelib install flixel-ui 2.6.5 --quiet --skip-dependencies
if errorlevel 1 goto :error

echo [ 4/11] hscript 2.4.0 ...
haxelib install hscript 2.4.0 --quiet
if errorlevel 1 goto :error

echo [ 5/11] tjson 1.4.0 ...
haxelib install tjson 1.4.0 --quiet
if errorlevel 1 goto :error

echo [ 6/11] hxCodec ...
haxelib install hxCodec --quiet --skip-dependencies
if errorlevel 1 goto :error

echo [ 7/11] hxvlc ...
haxelib install hxvlc --quiet --skip-dependencies
if errorlevel 1 goto :error

echo [ 8/11] hxcpp (git, ShadowEngineTeam fork) ...
haxelib git hxcpp https://github.com/ShadowEngineTeam/hxcpp --quiet --skip-dependencies
if errorlevel 1 goto :error

echo [ 9/11] lime (official 8.3.2) ...
haxelib install lime 8.3.2 --quiet
if errorlevel 1 goto :error

echo [10/11] mobile-controls (git) ...
haxelib install mobile-controls 1.0.0 --quiet --skip-dependencies
if errorlevel 1 goto :error

echo [11/11] openfl 9.5.2 ...
haxelib install openfl 9.5.2
if errorlevel 1 goto :error

echo [12/12] discord_rpc 1.0.0  ...
haxelib install discord_rpc 1.0.0 --quiet --skip-dependencies
if errorlevel 1 goto :error

echo [13/13] HxWebView 0.0.9  ...
haxelib install HxWebView 0.0.9 --quiet --skip-dependencies
if errorlevel 1 goto :error

echo.
echo ============================================================
echo  Done. Dependencies installed into:
echo    %HAXELIB_PATH%
echo.
echo  Build / run with the project-root dev.bat, e.g.:
echo    dev.bat test windows
echo ============================================================
echo.
pause
exit /b 0

:error
echo.
echo [FAILED] A haxelib command exited with errorlevel %errorlevel%.
echo Scroll up to see the actual error. The global haxelib was NOT modified.
exit /b 1

