$ErrorActionPreference = 'Stop'
$JiangHuVoiceRoot = if (Test-Path -LiteralPath (Join-Path $PSScriptRoot 'source\pyproject.toml')) { $PSScriptRoot } else { Split-Path -Parent (Split-Path -Parent $PSScriptRoot) }
$env:JIANGHUVOICE_ROOT = $JiangHuVoiceRoot
& (Join-Path $JiangHuVoiceRoot 'source\.venv\Scripts\python.exe') (Join-Path $JiangHuVoiceRoot 'source\scripts\manage_package.py') install standard
if ($LASTEXITCODE -ne 0) { throw 'Standard包安装/升级失败' }
$env:NLTK_DATA = Join-Path $JiangHuVoiceRoot 'cache\nltk_data'
& (Join-Path $JiangHuVoiceRoot 'runtime\engines\standard\gpt-sovits\d523079f\.venv\Scripts\python.exe') -c "import nltk; raise SystemExit(0 if nltk.download('averaged_perceptron_tagger_eng', download_dir=r'$($env:NLTK_DATA)', quiet=True) else 2)"
if ($LASTEXITCODE -ne 0) { throw '安装Standard中英混读词性资源失败' }
