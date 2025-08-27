@echo off
title VoiceMeeter Activation Tool
color 0A

:menu
cls
echo ===============================================
echo         VoiceMeeter Activation Tool
echo ===============================================
echo.
echo This tool attempts to activate VoiceMeeter by
echo modifying registry keys. Works best with
echo VoiceMeeter Potato v3.0.2.8 and earlier.
echo.
echo 1. Add registry key (Activate)
echo 2. Remove registry key (Deactivate)
echo 3. Try alternative registry paths
echo 4. Check current activation status
echo 5. Exit/Cancel
echo.
set /p choice=Enter your choice (1-5): 

if "%choice%"=="1" goto addkey
if "%choice%"=="2" goto removekey
if "%choice%"=="3" goto altpaths
if "%choice%"=="4" goto checkstatus
if "%choice%"=="5" goto cancel
echo Invalid choice. Please try again.
timeout /t 2 >nul
goto menu

:addkey
cls
echo Adding activation key...
echo.
reg add "HKEY_CURRENT_USER\VB-Audio\VoiceMeeter" /v "code" /t REG_DWORD /d 0x00123456 /f >nul 2>&1
if %errorlevel%==0 (
    echo [SUCCESS] Activation key added successfully!
    echo Close VoiceMeeter completely and restart it to see changes.
) else (
    echo [ERROR] Failed to add activation key.
    echo Make sure you're running as Administrator.
)
echo.
pause
goto menu

:removekey
cls
echo Removing activation key...
echo.
reg delete "HKEY_CURRENT_USER\VB-Audio\VoiceMeeter" /v "code" /f >nul 2>&1
if %errorlevel%==0 (
    echo [SUCCESS] Activation key removed successfully!
) else (
    echo [WARNING] Key not found or already removed.
)
echo.
pause
goto menu

:altpaths
cls
echo Trying alternative registry paths...
echo This may help if your VoiceMeeter version uses different locations.
echo.

echo Trying path 1: HKEY_LOCAL_MACHINE\SOFTWARE\VB-Audio\VoiceMeeter...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\VB-Audio\VoiceMeeter" /v "code" /t REG_DWORD /d 0x00123456 /f >nul 2>&1
if %errorlevel%==0 (
    echo [SUCCESS] Added to HKEY_LOCAL_MACHINE path
) else (
    echo [FAILED] Could not add to HKEY_LOCAL_MACHINE path
)

echo Trying path 2: HKEY_CURRENT_USER\SOFTWARE\VB-Audio\VoiceMeeter...
reg add "HKEY_CURRENT_USER\SOFTWARE\VB-Audio\VoiceMeeter" /v "code" /t REG_DWORD /d 0x00123456 /f >nul 2>&1
if %errorlevel%==0 (
    echo [SUCCESS] Added to HKEY_CURRENT_USER\SOFTWARE path
) else (
    echo [FAILED] Could not add to HKEY_CURRENT_USER\SOFTWARE path
)

echo Trying path 3: HKEY_CURRENT_USER\VB-Audio\VoiceMeeterPotato...
reg add "HKEY_CURRENT_USER\VB-Audio\VoiceMeeterPotato" /v "code" /t REG_DWORD /d 0x00123456 /f >nul 2>&1
if %errorlevel%==0 (
    echo [SUCCESS] Added to VoiceMeeterPotato specific path
) else (
    echo [FAILED] Could not add to VoiceMeeterPotato path
)

echo.
echo Alternative paths attempted. Close VoiceMeeter completely and restart it.
pause
goto menu

:checkstatus
cls
echo Checking current activation status...
echo.

echo Checking main registry path...
reg query "HKEY_CURRENT_USER\VB-Audio\VoiceMeeter" /v "code" >nul 2>&1
if %errorlevel%==0 (
    echo [FOUND] Activation key exists in main path
    reg query "HKEY_CURRENT_USER\VB-Audio\VoiceMeeter" /v "code"
) else (
    echo [NOT FOUND] No activation key in main path
)

echo.
echo Checking alternative paths...
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\VB-Audio\VoiceMeeter" /v "code" >nul 2>&1
if %errorlevel%==0 (
    echo [FOUND] Activation key exists in HKEY_LOCAL_MACHINE path
)

reg query "HKEY_CURRENT_USER\SOFTWARE\VB-Audio\VoiceMeeter" /v "code" >nul 2>&1
if %errorlevel%==0 (
    echo [FOUND] Activation key exists in HKEY_CURRENT_USER\SOFTWARE path
)

reg query "HKEY_CURRENT_USER\VB-Audio\VoiceMeeterPotato" /v "code" >nul 2>&1
if %errorlevel%==0 (
    echo [FOUND] Activation key exists in VoiceMeeterPotato path
)

echo.
pause
goto menu

:cancel
echo Exiting...
exit