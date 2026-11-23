$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
py -3 -m pip install --upgrade pip pyinstaller
$build = Join-Path $PSScriptRoot 'build-temp'
$out = Join-Path $PSScriptRoot 'dist\MahanAI'
if (Test-Path $build) { Remove-Item $build -Recurse -Force }
if (Test-Path $out) { Remove-Item $out -Recurse -Force }
py -3 -m PyInstaller --noconfirm --clean --windowed --onedir --name MahanAI --distpath $build app\mahanai.py
New-Item -ItemType Directory -Force -Path $out\runtime,$out\models | Out-Null
Copy-Item -Path (Join-Path $build 'MahanAI\*') -Destination $out -Recurse -Force
Copy-Item -Path (Join-Path $PSScriptRoot 'Run-MahanAI.bat') -Destination $out -Force
Write-Host ''
Write-Host 'Build completed: dist\MahanAI\MahanAI.exe' -ForegroundColor Green
Write-Host 'Place llama-server.exe in dist\MahanAI\runtime and GGUF model files in dist\MahanAI\models.'
Write-Host 'The dist\MahanAI folder is the portable application folder.'
