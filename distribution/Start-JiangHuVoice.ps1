$ErrorActionPreference = 'Stop'
$JiangHuVoiceRoot = if (Test-Path -LiteralPath (Join-Path $PSScriptRoot 'source\pyproject.toml')) {
    $PSScriptRoot
} else {
    Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
}
$ReaderPythonw = Join-Path $JiangHuVoiceRoot 'source\.venv\Scripts\pythonw.exe'
$ReaderPython = Join-Path $JiangHuVoiceRoot 'source\.venv\Scripts\python.exe'

if (-not (Test-Path -LiteralPath $ReaderPythonw)) {
    throw "JiangHuVoice Reader环境不存在。请先运行 $JiangHuVoiceRoot\Install-JiangHuVoice.ps1"
}

$env:JIANGHUVOICE_ROOT = $JiangHuVoiceRoot
$env:PYTHONUTF8 = '1'
$env:PYTHONIOENCODING = 'utf-8'
$env:UV_CACHE_DIR = Join-Path $JiangHuVoiceRoot 'cache\uv'
$env:HF_HOME = Join-Path $JiangHuVoiceRoot 'cache\huggingface'
$env:TORCH_HOME = Join-Path $JiangHuVoiceRoot 'cache\torch'
$env:TEMP = Join-Path $JiangHuVoiceRoot 'temp'
$env:TMP = Join-Path $JiangHuVoiceRoot 'temp'

Start-Process -FilePath $ReaderPythonw -ArgumentList '-m','jianghuvoice' -WorkingDirectory (Join-Path $JiangHuVoiceRoot 'source') -WindowStyle Hidden
