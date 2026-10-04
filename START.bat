@echo off
title NEON ASCENT - build and run
cd /d "%~dp0"

where node >nul 2>nul
if errorlevel 1 goto nonode

if exist node_modules goto build
echo Installing dependencies, first run only...
call npm install
if errorlevel 1 goto fail

:build
echo Building the game...
call npm run build
if errorlevel 1 goto fail
if not exist "dist\index.html" goto fail

echo.
echo Done. Opening dist\index.html
start "" "dist\index.html"
exit /b 0

:nonode
echo.
echo Node.js was not found.
echo Install Node.js LTS from https://nodejs.org and run START.bat again.
echo.
pause
exit /b 1

:fail
echo.
echo Build failed. Copy the error text above and send it to me.
echo.
pause
exit /b 1
