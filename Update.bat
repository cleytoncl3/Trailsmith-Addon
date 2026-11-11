@echo off
setlocal
title Trailsmith - Atualizador / Updater
rem Downloads the latest version from GitHub and updates this folder. No git needed.
rem Baixa a ultima versao do GitHub e atualiza esta pasta. Nao precisa de git.
rem Your saved data lives in WTF\...\SavedVariables and is never touched.
rem Seus dados ficam em WTF\...\SavedVariables e nao sao tocados.

set "REPO=cleytoncl3/Trailsmith-Addon"
set "BRANCH=main"
set "DEST=%~dp0"
set "TMP_DIR=%TEMP%\Trailsmith_update"

echo.
echo  Trailsmith - github.com/%REPO%
echo.
echo  Feche o WoW antes de atualizar (ou de /reload depois).
echo  Close WoW before updating (or /reload afterwards).
echo.

call :update "%REPO%" "%BRANCH%" "%DEST%" "Trailsmith"
if errorlevel 1 goto :fail

rem optional: the starter node database, if it is installed next to this addon
if exist "%DEST%..\GatherTrailData\GatherTrailData.toc" (
  call :update "cleytoncl3/GatherTrailData" "main" "%DEST%..\GatherTrailData\" "GatherTrailData"
)

echo.
echo  Pronto! Entre no jogo ou de /reload.  Done! Log in or /reload.
echo.
pause
exit /b 0

:update
rem %1 repo  %2 branch  %3 destination folder  %4 display name
set "SRC="
if exist "%TMP_DIR%" rmdir /s /q "%TMP_DIR%"
mkdir "%TMP_DIR%"
echo  Atualizando / Updating %~4 ...
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ErrorActionPreference='Stop'; [Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12;" ^
  "Invoke-WebRequest -UseBasicParsing -Uri 'https://github.com/%~1/archive/refs/heads/%~2.zip' -OutFile '%TMP_DIR%\repo.zip';" ^
  "Expand-Archive -Path '%TMP_DIR%\repo.zip' -DestinationPath '%TMP_DIR%\x' -Force"
if errorlevel 1 exit /b 1
for /d %%D in ("%TMP_DIR%\x\*") do set "SRC=%%D"
if not defined SRC exit /b 1
rem /XF Update.bat: the script does not overwrite itself while it runs
robocopy "%SRC%" "%~3." /E /XF Update.bat /XD .git /NFL /NDL /NJH /NJS /NP >nul
if errorlevel 8 exit /b 1
rmdir /s /q "%TMP_DIR%"
exit /b 0

:fail
echo.
echo  ERRO: nao foi possivel atualizar. Verifique a internet e tente de novo.
echo  ERROR: could not update. Check your internet connection and try again.
echo.
pause
exit /b 1
