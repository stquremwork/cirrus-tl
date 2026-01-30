# Установка кодировки для корректного отображения текста
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Language settings
$languages = @{
    'ru' = @{
        'title' = 'Настройка Windows (2026)'
        'search' = 'Панель Поиска: Иконка и текст'
        'activation' = 'Активация Windows (MAS GitHub)'
        'theme' = 'Выбор темы'
        'extensions' = 'Проводник: Показывать расширения файлов'
        'thispc' = 'Проводник: Открывать ''Этот компьютер'''
        'hidden' = 'Проводник: Показать скрытые файлы и папки'
        'recycle' = 'Удалить корзину с рабочего стола'
        'shortcuts' = 'Удалить ярлыки с рабочего стола'
        'unpin' = 'Открепить приложения от панели задач'
        'power' = 'Включить Максимальную производительность'
        'endtask' = 'Включить ''Завершить задачу'' на панели задач'
        'tiles' = 'Панель Пуск: Больше плиток'
        'clipboard' = 'Включить буфер обмена'
        'hibernate' = 'Включить гибернацию'
        'restart' = 'Перезапустить Проводник'
        'exit' = 'Выход'
        'lang' = 'Сменить язык интерфейса'
        'back' = 'Назад'
        'theme_dark' = 'Включить тёмную тему'
        'theme_light' = 'Включить светлую тему (по умолчанию)'
        'confirm_title' = 'Подтверждение действия'
        'continue' = 'Продолжить? (Y/N): '
        'cancelled' = 'Действие отменено'
        'use_arrows' = 'Используйте стрелки ↑↓ и Enter для выбора'
        'press_q' = "Нажмите 'Q' для выхода из программы"
    }
    'en' = @{
        'title' = 'Windows Setup (2026)'
        'search' = 'Search Panel: Icon and Text'
        'activation' = 'Windows Activation (MAS GitHub)'
        'theme' = 'Theme Selection'
        'extensions' = 'Explorer: Show file extensions'
        'thispc' = 'Explorer: Open ''This PC'''
        'hidden' = 'Explorer: Show hidden files and folders'
        'recycle' = 'Remove Recycle Bin from desktop'
        'shortcuts' = 'Remove shortcuts from desktop'
        'unpin' = 'Unpin apps from taskbar'
        'power' = 'Enable Maximum Performance'
        'endtask' = 'Enable ''End Task'' on taskbar'
        'tiles' = 'Start Menu: More tiles'
        'clipboard' = 'Enable Clipboard History'
        'hibernate' = 'Enable Hibernation'
        'restart' = 'Restart Explorer'
        'exit' = 'Exit'
        'lang' = 'Change Interface Language'
        'back' = 'Back'
        'theme_dark' = 'Enable Dark Theme'
        'theme_light' = 'Enable Light Theme (default)'
        'confirm_title' = 'Confirm Action'
        'continue' = 'Continue? (Y/N): '
        'cancelled' = 'Action cancelled'
        'use_arrows' = 'Use ↑↓ arrows and Enter to select'
        'press_q' = "Press 'Q' to exit"
    }
}

$currentLang = if (Test-Path "$env:TEMP\winsetup_lang.txt") { 
    Get-Content "$env:TEMP\winsetup_lang.txt" -ErrorAction SilentlyContinue | Select-Object -First 1 
} else { 'ru' }

function Get-LangText {
    param([string]$Key)
    return $languages[$script:currentLang][$Key]
}

function Set-Language {
    param([string]$Lang)
    
    $script:currentLang = $Lang
    Set-Content -Path "$env:TEMP\winsetup_lang.txt" -Value $Lang -Force
    Write-Host "$(Get-LangText 'title'): Language changed to $Lang" -ForegroundColor Green
    Write-Host "Restarting interface..." -ForegroundColor Yellow
    Start-Sleep -Seconds 2
}

function Confirm-Action {
    param(
        [string]$Message,
        [string]$Question = $null
    )
    
    if (-not $Question) { $Question = Get-LangText 'continue' }
    
    Write-Host "`n$Message" -ForegroundColor Yellow
    Write-Host $Question -ForegroundColor Cyan -NoNewline
    
    do {
        $key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        $response = $key.Character.ToString().ToLower()
        
        if ($response -eq 'y' -or $response -eq 'д' -or $response -eq 'я') {
            Write-Host "`n"
            return $true
        }
        elseif ($response -eq 'n' -or $response -eq 'н') {
            Write-Host "`n$(Get-LangText 'cancelled')" -ForegroundColor Yellow
            Start-Sleep -Seconds 1
            return $false
        }
    } while ($true)
}

function Show-Menu {
    param (
        [string]$Title = $null,
        [array]$Options,
        [string]$BackOption = $null
    )

    if (-not $Title) { $Title = Get-LangText 'title' }
    if (-not $BackOption) { $BackOption = Get-LangText 'back' }

    $selectedIndex = 0
    $key = $null

    while ($true) {
        Clear-Host
        Write-Host "=== $Title ===" -ForegroundColor Cyan
        Write-Host "$(Get-LangText 'use_arrows')" -ForegroundColor Yellow
        Write-Host "$(Get-LangText 'press_q')`n" -ForegroundColor Yellow

        for ($i = 0; $i -lt $Options.Count; $i++) {
            if ($i -eq $selectedIndex) {
                Write-Host " > $($Options[$i]) " -ForegroundColor Black -BackgroundColor White
            }
            else {
                Write-Host "   $($Options[$i]) "
            }
        }

        $key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown").VirtualKeyCode
        
        if ($key -eq 38) { # Up arrow
            $selectedIndex = ($selectedIndex - 1 + $Options.Count) % $Options.Count
        }
        elseif ($key -eq 40) { # Down arrow
            $selectedIndex = ($selectedIndex + 1) % $Options.Count
        }
        elseif ($key -eq 13) { # Enter
            if ($Options[$selectedIndex] -eq $BackOption) {
                return "back"
            }
            return $selectedIndex
        }
        elseif ($key -eq 81 -or $key -eq 27) { # Q key или ESC
            return "exit"
        }
    }
}

function Show-LanguageMenu {
    $langItems = @(
        "English (Default)",
        "Русский",
        "Back"
    )
    
    do {
        $langChoice = Show-Menu -Title "Interface Language / Язык интерфейса" -Options $langItems -BackOption "Back / Назад"
        
        if ($langChoice -eq "exit") { return "exit" }
        elseif ($langChoice -eq "back") { return "back" }
        
        switch ($langChoice) {
            0 { Set-Language 'en'; return "exit" }
            1 { Set-Language 'ru'; return "exit" }
        }
    } while ($true)
}

function Show-ThemeMenu {
    $themeItems = @(
        Get-LangText 'theme_dark',
        Get-LangText 'theme_light',
        Get-LangText 'back'
    )
    
    do {
        $themeChoice = Show-Menu -Title Get-LangText 'theme' -Options $themeItems -BackOption Get-LangText 'back'
        
        if ($themeChoice -eq "exit") { return "exit" }
        elseif ($themeChoice -eq "back") { return "back" }
        
        switch ($themeChoice) {
            0 { # Dark theme
                if (Confirm-Action -Message "Dark theme will be enabled for system and apps.`nExplorer restart required.") {
                    try {
                        Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize" -Name "AppsUseLightTheme" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize" -Name "SystemUsesLightTheme" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\DWM" -Name "ColorPrevalence" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                        Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
                        Write-Host "$(Get-LangText 'theme_dark') enabled!" -ForegroundColor Green
                    }
                    catch {
                        Write-Host "Theme setup error: $($_.ToString())" -ForegroundColor Red
                    }
                    Start-Sleep -Seconds 1
                }
                return "back"
            }
            1 { # Light theme
                if (Confirm-Action -Message "Light theme will be enabled for system and apps.`nExplorer restart required.") {
                    try {
                        Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize" -Name "AppsUseLightTheme" -Value 1 -Type DWord -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize" -Name "SystemUsesLightTheme" -Value 1 -Type DWord -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\DWM" -Name "ColorPrevalence" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                        Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
                        Write-Host "$(Get-LangText 'theme_light') enabled!" -ForegroundColor Green
                    }
                    catch {
                        Write-Host "Theme setup error: $($_.ToString())" -ForegroundColor Red
                    }
                    Start-Sleep -Seconds 1
                }
                return "back"
            }
        }
    } while ($true)
}

# Остальные функции остаются такими же, но используют Get-LangText где нужно
function Remove-DesktopShortcuts {
    Write-Host "`n=== $(Get-LangText 'shortcuts'.ToUpper()) ===" -ForegroundColor Cyan
    
    $shortcutsToRemove = @(
        "Microsoft Edge.lnk",
        "Mail.lnk", 
        "Store.lnk"
    )
    
    Write-Host "`n$(Get-LangText 'shortcuts'):" -ForegroundColor Yellow
    foreach ($shortcut in $shortcutsToRemove) {
        Write-Host "  • $shortcut" -ForegroundColor White
    }
    
    if (Confirm-Action -Message "`n$(Get-LangText 'confirm_title')") {
        # ... остальной код без изменений
        $removedCount = 0
        $desktopPaths = @("$env:Public\Desktop", "$env:USERPROFILE\Desktop")
        
        foreach ($desktopPath in $desktopPaths) {
            foreach ($shortcut in $shortcutsToRemove) {
                $fullPath = Join-Path $desktopPath $shortcut
                if (Test-Path $fullPath) {
                    try {
                        Remove-Item -Path $fullPath -Force -ErrorAction SilentlyContinue
                        Write-Host "Removed: $shortcut" -ForegroundColor Green
                        $removedCount++
                    }
                    catch {
                        Write-Host "Failed to remove $shortcut" -ForegroundColor Yellow
                    }
                }
            }
        }
        
        Write-Host "`n$removedCount shortcuts removed!" -ForegroundColor Green
    }
    Start-Sleep -Seconds 1
}

# ... остальные функции аналогично используют Get-LangText

$mainMenuItems = @(
    Get-LangText 'lang',
    Get-LangText 'search',
    Get-LangText 'activation',
    Get-LangText 'theme',
    Get-LangText 'extensions',
    Get-LangText 'thispc',
    Get-LangText 'hidden',
    Get-LangText 'recycle',
    Get-LangText 'shortcuts',
    Get-LangText 'unpin',
    Get-LangText 'power',
    Get-LangText 'endtask',
    Get-LangText 'tiles',
    Get-LangText 'clipboard',
    Get-LangText 'hibernate',
    Get-LangText 'restart',
    Get-LangText 'exit'
)

# Проверка на права администратора
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "`nWARNING: Some features require administrator rights!" -ForegroundColor Red
    Write-Host "Run as administrator recommended.`n" -ForegroundColor Yellow
    Start-Sleep -Seconds 2
}

# Основной цикл программы
do {
    $choice = Show-Menu -Title Get-LangText 'title' -Options $mainMenuItems
    
    if ($choice -eq "exit") {
        Write-Host "`nGoodbye..." -ForegroundColor Yellow
        Start-Sleep -Seconds 1
        exit
    }
    
    switch ($choice) {
        0 { # Language change - FIRST ITEM
            Show-LanguageMenu
        }
        # ... остальные пункты меню сместились на 1 позицию
        1 { # Поиск (был 0)
            if (Confirm-Action -Message "Search panel will be set to 'Icon and Text' mode.") {
                try {
                    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 3 -ErrorAction Stop
                    Write-Host "Search panel configured!" -ForegroundColor Green 
                }
                catch {
                    Write-Host "Search panel error: $($_.ToString())" -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        # Продолжить смещение остальных пунктов...
        # (все остальные case увеличиваются на 1)
    }
} while ($true)
