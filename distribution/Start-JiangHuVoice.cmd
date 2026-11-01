@echo off
setlocal
set "JIANGHUVOICE_ROOT=%~dp0"
set "JIANGHUVOICE_APP_DIR=%~dp0app"
set "PYTHONUTF8=1"
set "PYTHONIOENCODING=utf-8"
start "" "%~dp0app\JiangHuVoiceReader.exe"
