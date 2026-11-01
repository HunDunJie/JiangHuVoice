$ErrorActionPreference = 'Stop'
$JiangHuVoiceRoot = if (Test-Path -LiteralPath (Join-Path $PSScriptRoot 'source\pyproject.toml')) { $PSScriptRoot } else { Split-Path -Parent (Split-Path -Parent $PSScriptRoot) }
$env:JIANGHUVOICE_ROOT = $JiangHuVoiceRoot
& (Join-Path $JiangHuVoiceRoot 'source\.venv\Scripts\python.exe') (Join-Path $JiangHuVoiceRoot 'source\scripts\manage_package.py') install basic
if ($LASTEXITCODE -ne 0) { throw 'Basic包安装/升级失败' }
