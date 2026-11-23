@echo off
cd /d "%~dp0"
if exist "MahanAI.exe" (start "" "%~dp0MahanAI.exe" & exit /b)
where py >nul 2>nul
if %errorlevel%==0 (py -3 app\mahanai.py & exit /b)
where python >nul 2>nul
if %errorlevel%==0 (python app\mahanai.py & exit /b)
echo Python 3 is required for this development launcher. For a standalone EXE, run build.ps1 on Windows.
pause
