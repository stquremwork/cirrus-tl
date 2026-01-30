# Установка кодировки для корректного отображения текста
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Глобальная переменная для языка
$script:Language = $null

$script:Translations = @{
    "en" = @{
        "MainTitle" = "Windows Setup (2026)"
        "UseArrows" = "Use ↑↓ arrows and Enter to select"
        "PressQ" = "Press 'Q' to exit"
        "Continue" = "Continue? (Y/N): "
        "Cancelled" = "Action cancelled"
        "LangSelected" = "Language selected!"
        "DarkTheme" = "Enable dark theme"
        "LightTheme" = "Enable light theme"
        "ThemeTitle" = "Theme Selection"
        "DarkThemeMsg" = "Dark theme will be enabled for system and apps.`nExplorer restart required."
        "LightThemeMsg" = "Light theme will be enabled for system and apps.`nExplorer restart required."
        "ThemeEnabled" = "Theme enabled!"
        "ThemeError" = "Theme setup error: "
        "RemoveShortcutsTitle" = "REMOVE DESKTOP SHORTCUTS"
        "ShortcutsList" = "Following shortcuts will be removed:"
        "ConfirmRemoveShortcuts" = "Are you sure you want to remove these shortcuts?"
        "Removed" = "Removed: "
        "RemoveShortcutsError" = "Failed to remove "
        "ShortcutsRemoved" = "shortcuts removed!"
        "UnpinTitle" = "UNPIN APPS FROM TASKBAR"
        "AppsList" = "Following apps will be unpinned:"
        "ConfirmUnpin" = "Are you sure you want to unpin these apps?"
        "UnpinProcess" = "Unpinning process:"
        "Unpinned" = "✓ unpinned"
        "NotFound" = "⚠ not found on taskbar"
        "NoUnpinCommand" = "⚠ No unpin command found for "
        "UnpinError" = "✗ Unpin error for "
        "AppsUnpinned" = "Apps unpinned out of "
        "SearchSetup" = "Search bar will be set to 'Icon and text' mode."
        "SearchConfigured" = "Search bar configured: Icon and text!"
        "SearchError" = "Search bar setup error: "
        "ActivationTitle" = "WINDOWS ACTIVATION"
        "ActivationMsg" = "Windows activation via MAS will be launched"
        "ActivationSource" = "Source: https://get.activated.win"
        "ConfirmActivation" = "Are you sure you want to activate Windows?"
        "ActivationRunning" = "Running Windows activation via MAS..."
        "ActivationDone" = "Activation completed!"
        "ActivationError" = "Activation error: "
        "FileExtMsg" = "Explorer will show file extensions (.txt, .exe, .jpg)."
        "FileExtEnabled" = "File extensions now visible!"
        "FileExtError" = "File extensions setup error: "
        "ThisPC Msg" = "Explorer will open 'This PC' instead of 'Quick access'."
        "ThisPCEnabled" = "Explorer now opens 'This PC'!"
        "ThisPCError" = "'This PC' setup error: "
        "HiddenFilesMsg" = "Hidden files and folders will be shown, including protected system files."
        "HiddenFilesEnabled" = "Hidden files and folders now visible!"
        "HiddenError" = "Hidden files setup error: "
        "RecycleBinMsg" = "Recycle Bin icon will be removed from desktop.`nExplorer restart may be required."
        "RecycleBinRemoved" = "Recycle Bin removed from desktop!"
        "RecycleError" = "Recycle Bin removal error: "
        "PowerMsg" = "Power plan 'Ultimate Performance' will be added."
        "PowerAdded" = "'Ultimate Performance' power plan added!"
        "PowerError" = "Power plan setup error: "
        "EndTaskMsg" = "'End Task' option will be added to taskbar context menu."
        "EndTaskEnabled" = "'End Task' option enabled on taskbar!"
        "EndTaskError" = "End Task setup error: "
        "StartTilesMsg" = "Number of Start menu tiles will be increased."
        "StartTilesEnabled" = "Start menu tiles count increased!"
        "StartTilesError" = "Start tiles setup error: "
        "ClipboardMsg" = "Clipboard history (Win+V) will be enabled."
        "ClipboardEnabled" = "Clipboard history enabled!"
        "ClipboardError" = "Clipboard setup error: "
        "HibernateMsg" = "Hibernate will be enabled and added to power menu."
        "HibernateEnabled" = "Hibernate enabled and added to power menu!"
        "HibernateError" = "Hibernate setup error: "
        "RestartExplorerTitle" = "RESTART EXPLORER"
        "RestartExplorerMsg" = "Windows Explorer will be restarted.`nAll Explorer windows will close and reopen."
        "ExplorerRestarted" = "Explorer restarted!"
        "ExplorerError" = "Explorer restart error: "
        "AdminWarning" = "WARNING: Some functions require administrator rights!"
        "RunAsAdmin" = "Recommended to run script as administrator."
    }
    "ru" = @{
        "MainTitle" = "Настройка Windows (2026)"
        "UseArrows" = "Используйте стрелки ↑↓ и Enter для выбора"
        "PressQ" = "Нажмите 'Q' для выхода из программы"
        "Continue" = "Продолжить? (Y/N): "
        "Cancelled" = "Действие отменено"
        "LangSelected" = "Язык выбран!"
        "DarkTheme" = "Включить тёмную тему"
        "LightTheme" = "Включить светлую тему"
        "ThemeTitle" = "Выбор темы"
        "DarkThemeMsg" = "Будет включена тёмная тема для системы и приложений.`nТребуется перезапуск Проводника."
        "LightThemeMsg" = "Будет включена светлая тема для системы и приложений.`nТребуется перезапуск Проводника."
        "ThemeEnabled" = "Тема включена!"
        "ThemeError" = "Ошибка при настройке темы: "
        "RemoveShortcutsTitle" = "УДАЛЕНИЕ ЯРЛЫКОВ С РАБОЧЕГО СТОЛА"
        "ShortcutsList" = "Будут удалены следующие ярлыки:"
        "ConfirmRemoveShortcuts" = "Вы уверены, что хотите удалить эти ярлыки?"
        "Removed" = "Удалено: "
        "RemoveShortcutsError" = "Не удалось удалить "
        "ShortcutsRemoved" = "ярлыков удалено!"
        "UnpinTitle" = "ОТКРЕПЛЕНИЕ ПРИЛОЖЕНИЙ ОТ ПАНЕЛИ ЗАДАЧ"
        "AppsList" = "Будут откреплены следующие приложения:"
        "ConfirmUnpin" = "Вы уверены, что хотите открепить эти приложения?"
        "UnpinProcess" = "Процесс открепления:"
        "Unpinned" = "✓ откреплен"
        "NotFound" = "⚠ не найден на панели задач"
        "NoUnpinCommand" = "⚠ Не найдена команда открепления для "
        "UnpinError" = "✗ Ошибка при откреплении "
        "AppsUnpinned" = "Откреплено из приложений"
        "SearchSetup" = "Настройка панели поиска: будет установлен режим 'Иконка и текст'."
        "SearchConfigured" = "Панель поиска настроена: Иконка и текст!"
        "SearchError" = "Ошибка при настройке панели поиска: "
        "ActivationTitle" = "АКТИВАЦИЯ WINDOWS"
        "ActivationMsg" = "Будет запущен скрипт активации Windows через MAS"
        "ActivationSource" = "Источник: https://get.activated.win"
        "ConfirmActivation" = "Вы уверены, что хотите активировать Windows?"
        "ActivationRunning" = "Запуск активации Windows через MAS..."
        "ActivationDone" = "Активация завершена!"
        "ActivationError" = "Ошибка при активации: "
        "FileExtMsg" = "Проводник будет настроен на показ расширений файлов (например: .txt, .exe, .jpg)."
        "FileExtEnabled" = "Расширения файлов теперь показываются!"
        "FileExtError" = "Ошибка при настройке: "
        "ThisPC Msg" = "Проводник будет открываться в разделе 'Этот компьютер' вместо 'Быстрого доступа'."
        "ThisPCEnabled" = "Проводник теперь открывается в 'Этот компьютер'!"
        "ThisPCError" = "Ошибка при настройке: "
        "HiddenFilesMsg" = "Будут показаны скрытые файлы и папки, включая защищенные системные файлы."
        "HiddenFilesEnabled" = "Скрытые файлы и папки теперь показываются!"
        "HiddenError" = "Ошибка при настройке: "
        "RecycleBinMsg" = "Иконка корзины будет удалена с рабочего стола.`nДля применения изменений потребуется перезапуск проводника."
        "RecycleBinRemoved" = "Корзина удалена с рабочего стола!"
        "RecycleError" = "Ошибка при удалении корзины: "
        "PowerMsg" = "Будет добавлена схема электропитания 'Максимальная производительность'."
        "PowerAdded" = "Схема 'Максимальная производительность' добавлена!"
        "PowerError" = "Ошибка при добавлении схемы питания: "
        "EndTaskMsg" = "Будет добавлена опция 'Завершить задачу' в контекстное меню панели задач."
        "EndTaskEnabled" = "Опция 'Завершить задачу' включена на панели задач!"
        "EndTaskError" = "Ошибка при настройке: "
        "StartTilesMsg" = "Количество плиток в меню Пуск будет увеличено."
        "StartTilesEnabled" = "Количество плиток в меню Пуск увеличено!"
        "StartTilesError" = "Ошибка при настройке: "
        "ClipboardMsg" = "Будет включена история буфера обмена (Win+V)."
        "ClipboardEnabled" = "История буфера обмена включена!"
        "ClipboardError" = "Ошибка при настройке буфера обмена: "
        "HibernateMsg" = "Будет включена гибернация и добавлена опция в меню питания."
        "HibernateEnabled" = "Гибернация включена и опция добавлена в меню питания!"
        "HibernateError" = "Ошибка при включении гибернации: "
        "RestartExplorerTitle" = "ПЕРЕЗАПУСК ПРОВОДНИКА"
        "RestartExplorerMsg" = "Будет выполнен перезапуск Проводника Windows.`nВсе открытые окна Проводника закроются и откроются заново."
        "ExplorerRestarted" = "Проводник перезапущен!"
        "ExplorerError" = "Ошибка при перезапуске проводника: "
        "AdminWarning" = "ВНИМАНИЕ: Для работы некоторых функций требуются права администратора!"
        "RunAsAdmin" = "Рекомендуется запустить скрипт от имени администратора."
    }
}

function Get-Text {
    param([string]$Key)
    if ($script:Language -and $script:Translations[$script:Language].ContainsKey($Key)) {
        return $script:Translations[$script:Language][$Key]
    }
    elseif ($script:Translations["ru"].ContainsKey($Key)) {
        return $script:Translations["ru"][$Key]
    }
    return $Key
}

function Confirm-Action {
    param([string]$Message)
    
    Write-Host "`n$Message" -ForegroundColor Yellow
    Write-Host (Get-Text "Continue") -ForegroundColor Cyan -NoNewline
    
    do {
        $key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        $response = $key.Character.ToString().ToLower()
        
        if ($response -eq 'y' -or $response -eq 'д') {
            Write-Host "`n"
            return $true
        }
        elseif ($response -eq 'n' -or $response -eq 'н') {
            Write-Host "`n" (Get-Text "Cancelled") -ForegroundColor Yellow
            Start-Sleep -Seconds 1
            return $false
        }
    } while ($true)
}

function Show-Menu {
    param([array]$Options, [string]$Title)

    $selectedIndex = 0
    while ($true) {
        Clear-Host
        Write-Host "=== $Title ===" -ForegroundColor Cyan
        Write-Host (Get-Text "UseArrows") -ForegroundColor Yellow
        Write-Host (Get-Text "PressQ") "`n" -ForegroundColor Yellow

        for ($i = 0; $i -lt $Options.Count; $i++) {
            if ($i -eq $selectedIndex) {
                Write-Host " > $($Options[$i]) " -ForegroundColor Black -BackgroundColor White
            } else {
                Write-Host "   $($Options[$i]) "
            }
        }

        $key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown").VirtualKeyCode
        
        if ($key -eq 38) { $selectedIndex = ($selectedIndex - 1 + $Options.Count) % $Options.Count }
        elseif ($key -eq 40) { $selectedIndex = ($selectedIndex + 1) % $Options.Count }
        elseif ($key -eq 13) { return $selectedIndex }
        elseif ($key -eq 81 -or $key -eq 27) { exit }
    }
}

function Show-LanguageSelection {
    $langOptions = @("English", "Русский")
    $choice = Show-Menu -Options $langOptions -Title "Select Language / Выберите язык"
    
    if ($choice -eq 0) { 
        $script:Language = "en" 
    } else { 
        $script:Language = "ru" 
    }
    
    Clear-Host
    Write-Host (Get-Text "LangSelected") -ForegroundColor Green
    Write-Host "`n" -ForegroundColor Green
    Start-Sleep -Seconds 1
}

function Show-ThemeMenu {
    $themeItems = @(
        (Get-Text "DarkTheme"),
        (Get-Text "LightTheme"),
        "Back/Назад"
    )
    
    do {
        $themeChoice = Show-Menu -Options $themeItems -Title (Get-Text "ThemeTitle")
        
        if ($themeChoice -eq 2) { return "back" }
        elseif ($themeChoice -eq "exit") { exit }
        
        switch ($themeChoice) {
            0 { 
                if (Confirm-Action -Message (Get-Text "DarkThemeMsg")) {
                    try {
                        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "ColorPrevalence" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                        Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
                        Write-Host (Get-Text "ThemeEnabled") -ForegroundColor Green
                    } catch {
                        Write-Host (Get-Text "ThemeError") $_.Exception.Message -ForegroundColor Red
                    }
                    Start-Sleep -Seconds 1
                }
            }
            1 { 
                if (Confirm-Action -Message (Get-Text "LightThemeMsg")) {
                    try {
                        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 1 -Type DWord -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 1 -Type DWord -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "ColorPrevalence" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                        Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
                        Write-Host (Get-Text "ThemeEnabled") -ForegroundColor Green
                    } catch {
                        Write-Host (Get-Text "ThemeError") $_.Exception.Message -ForegroundColor Red
                    }
                    Start-Sleep -Seconds 1
                }
            }
        }
    } while ($true)
}

function Remove-DesktopShortcuts {
    Write-Host "`n===" (Get-Text "RemoveShortcutsTitle") "===" -ForegroundColor Cyan
    
    $shortcutsToRemove = @("Microsoft Edge.lnk", "Mail.lnk", "Store.lnk")
    
    Write-Host "`n" (Get-Text "ShortcutsList") -ForegroundColor Yellow
    foreach ($shortcut in $shortcutsToRemove) {
        Write-Host "  • $shortcut" -ForegroundColor White
    }
    
    if (Confirm-Action -Message (Get-Text "ConfirmRemoveShortcuts")) {
        $removedCount = 0
        $desktopPaths = @("$env:Public\Desktop", "$env:USERPROFILE\Desktop")
        
        foreach ($desktopPath in $desktopPaths) {
            foreach ($shortcut in $shortcutsToRemove) {
                $fullPath = Join-Path $desktopPath $shortcut
                if (Test-Path $fullPath) {
                    try {
                        Remove-Item -Path $fullPath -Force -ErrorAction SilentlyContinue
                        Write-Host (Get-Text "Removed") "$shortcut" -ForegroundColor Green
                        $removedCount++
                    } catch {
                        Write-Host (Get-Text "RemoveShortcutsError") "${shortcut}: $($_.Exception.Message)" -ForegroundColor Yellow
                    }
                }
            }
        }
        Write-Host "`n" (Get-Text "ShortcutsRemoved") $removedCount -ForegroundColor Green
    }
    Start-Sleep -Seconds 1
}

function Unpin-FromTaskbar {
    param([string]$AppName, [string]$DisplayName)
    
    try {
        $shell = New-Object -ComObject Shell.Application
        $folder = $shell.Namespace("shell:::{4234d49b-0245-4df3-b780-3893943456e1}")
        $items = $folder.Items()
        $item = $items | Where-Object { $_.Name -match $AppName }
        
        if ($item) {
            $verbs = $item.Verbs()
            $unpinVerb = $verbs | Where-Object { $_.Name.replace('&','') -match "Unpin from taskbar|Открепить от панели задач|Открепить от панели" }
            
            if ($unpinVerb) {
                $unpinVerb.DoIt()
                Write-Host "  $(Get-Text 'Unpinned') $DisplayName" -ForegroundColor Green
                return $true
            } else {
                Write-Host "  " (Get-Text "NoUnpinCommand") "$DisplayName" -ForegroundColor Yellow
                return $false
            }
        } else {
            Write-Host "  " (Get-Text "NotFound") " $DisplayName" -ForegroundColor Yellow
            return $false
        }
    } catch {
        Write-Host ("  " + (Get-Text "UnpinError") + " $DisplayName`: $($_.Exception.Message)") -ForegroundColor Red
        return $false
    }
}

function Unpin-AppsFromTaskbar {
    Write-Host "`n===" (Get-Text "UnpinTitle") "===" -ForegroundColor Cyan
    
    $appsToUnpin = @(
        @{AppName = "Outlook"; DisplayName = if ($script:Language -eq "en") { "Outlook" } else { "Outlook (Почта)" }},
        @{AppName = "Microsoft Store"; DisplayName = if ($script:Language -eq "en") { "Microsoft Store" } else { "Microsoft Store" }},
        @{AppName = "Microsoft Edge"; DisplayName = if ($script:Language -eq "en") { "Microsoft Edge" } else { "Microsoft Edge" }},
        @{AppName = "Weather"; DisplayName = if ($script:Language -eq "en") { "Weather" } else { "Погода" }},
        @{AppName = "Xbox"; DisplayName = if ($script:Language -eq "en") { "Xbox" } else { "Xbox" }}
    )
    
    Write-Host "`n" (Get-Text "AppsList") -ForegroundColor Yellow
    foreach ($app in $appsToUnpin) {
        Write-Host "  • $($app.DisplayName)" -ForegroundColor White
    }
    
    if (Confirm-Action -Message (Get-Text "ConfirmUnpin")) {
        $successCount = 0
        Write-Host "`n" (Get-Text "UnpinProcess") -ForegroundColor Cyan
        
        foreach ($app in $appsToUnpin) {
            if (Unpin-FromTaskbar -AppName $app.AppName -DisplayName $app.DisplayName) {
                $successCount++
            }
            Start-Sleep -Milliseconds 300
        }
        Write-Host "`n" (Get-Text "AppsUnpinned") "$successCount из $($appsToUnpin.Count)" -ForegroundColor Green
    }
    Start-Sleep -Seconds 1
}

# ПЕРВЫЙ ЭКРАН - ВЫБОР ЯЗЫКА
Show-LanguageSelection

# Главное меню после выбора языка
$mainMenuItems = if ($script:Language -eq "en") {
    @(
        "Search Bar: Icon + Text",
        "Windows Activation (MAS GitHub)",
        "Theme Selection",
        "Explorer: Show file extensions",
        "Explorer: Open 'This PC'",
        "Explorer: Show hidden files",
        "Remove Recycle Bin from Desktop",
        "Remove shortcuts from Desktop",
        "Unpin apps from Taskbar",
        "Enable Ultimate Performance",
        "Enable 'End Task' on Taskbar",
        "Start Menu: More tiles",
        "Enable Clipboard History",
        "Enable Hibernate",
        "Restart Explorer",
        "Exit"
    )
} else {
    @(
        "Панель Поиска: Иконка и текст",
        "Активация Windows (MAS GitHub)",
        "Выбор темы",
        "Проводник: Показывать расширения файлов",
        "Проводник: Открывать 'Этот компьютер'",
        "Проводник: Показать скрытые файлы и папки",
        "Удалить корзину с рабочего стола",
        "Удалить ярлыки с рабочего стола",
        "Открепить приложения от панели задач",
        "Включить Максимальную производительность",
        "Включить 'Завершить задачу' на панели задач",
        "Панель Пуск: Больше плиток",
        "Включить буфер обмена",
        "Включить гибернацию",
        "Перезапустить Проводник",
        "Выход"
    )
}

# Проверка на права администратора
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "`n" (Get-Text "AdminWarning") -ForegroundColor Red
    Write-Host (Get-Text "RunAsAdmin") "`n" -ForegroundColor Yellow
    Start-Sleep -Seconds 2
}

# Основной цикл программы
do {
    $choice = Show-Menu -Options $mainMenuItems -Title (Get-Text "MainTitle")
    
    switch ($choice) {
        0 { # Поиск
            if (Confirm-Action -Message (Get-Text "SearchSetup")) {
                try {
                    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 3 -ErrorAction Stop
                    Write-Host (Get-Text "SearchConfigured") -ForegroundColor Green 
                }
                catch {
                    Write-Host (Get-Text "SearchError") $_.Exception.Message -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        1 { # Активация
            Write-Host "`n===" (Get-Text "ActivationTitle") "===" -ForegroundColor Cyan
            Write-Host "`n" (Get-Text "ActivationMsg") -ForegroundColor Yellow
            Write-Host (Get-Text "ActivationSource") -ForegroundColor Yellow
            
            if (Confirm-Action -Message (Get-Text "ConfirmActivation")) {
                Write-Host "`n" (Get-Text "ActivationRunning") -ForegroundColor Yellow
                try {
                    Invoke-RestMethod -Uri "https://get.activated.win" | Invoke-Expression
                    Write-Host (Get-Text "ActivationDone") -ForegroundColor Green
                }
                catch {
                    Write-Host (Get-Text "ActivationError") $_.Exception.Message -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 2
        }
        2 { # Тема
            Show-ThemeMenu
        }
        3 { # Расширения файлов
            if (Confirm-Action -Message (Get-Text "FileExtMsg")) {
                try {
                    & reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f | Out-Null
                    Write-Host (Get-Text "FileExtEnabled") -ForegroundColor Green 
                }
                catch {
                    Write-Host (Get-Text "FileExtError") $_.Exception.Message -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        4 { # Этот компьютер
            if (Confirm-Action -Message (Get-Text "ThisPC Msg")) {
                try {
                    & reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f | Out-Null
                    Write-Host (Get-Text "ThisPCEnabled") -ForegroundColor Green 
                }
                catch {
                    Write-Host (Get-Text "ThisPCError") $_.Exception.Message -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        5 { # Скрытые файлы
            if (Confirm-Action -Message (Get-Text "HiddenFilesMsg")) {
                try {
                    & reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f | Out-Null
                    & reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t REG_DWORD /d 1 /f | Out-Null
                    Write-Host (Get-Text "HiddenFilesEnabled") -ForegroundColor Green 
                }
                catch {
                    Write-Host (Get-Text "HiddenError") $_.Exception.Message -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        6 { # Удалить корзину
            if (Confirm-Action -Message (Get-Text "RecycleBinMsg")) {
                try {
                    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name "{645FF040-5081-101B-9F08-00AA002F954E}" -Value 1
                    Write-Host (Get-Text "RecycleBinRemoved") -ForegroundColor Green
                }
                catch {
                    Write-Host (Get-Text "RecycleError") $_.Exception.Message -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        7 { # Удалить ярлыки
            Remove-DesktopShortcuts
        }
        8 { # Открепить приложения
            Unpin-AppsFromTaskbar
        }
        9 { # Производительность
            if (Confirm-Action -Message (Get-Text "PowerMsg")) {
                try {
                    & powercfg.exe -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 2>$null
                    Write-Host (Get-Text "PowerAdded") -ForegroundColor Green 
                }
                catch {
                    Write-Host (Get-Text "PowerError") $_.Exception.Message -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        10 { # Завершить задачу
            if (Confirm-Action -Message (Get-Text "EndTaskMsg")) {
                try {
                    & reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings" /v TaskbarEndTask /t REG_DWORD /d 1 /f | Out-Null
                    Write-Host (Get-Text "EndTaskEnabled") -ForegroundColor Green 
                }
                catch {
                    Write-Host (Get-Text "EndTaskError") $_.Exception.Message -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        11 { # Больше плиток
            if (Confirm-Action -Message (Get-Text "StartTilesMsg")) {
                try {
                    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_Layout" -Value 1 -ErrorAction SilentlyContinue
                    Write-Host (Get-Text "StartTilesEnabled") -ForegroundColor Green 
                }
                catch {
                    Write-Host (Get-Text "StartTilesError") $_.Exception.Message -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        12 { # Буфер обмена
            if (Confirm-Action -Message (Get-Text "ClipboardMsg")) {
                try {
                    if (!(Test-Path "HKCU:\Software\Microsoft\Clipboard")) { 
                        New-Item -Path "HKCU:\Software\Microsoft\Clipboard" -Force | Out-Null
                    }
                    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Clipboard" -Name "CloudClipboardAndHistoryEnabled" -Value 1
                    Write-Host (Get-Text "ClipboardEnabled") -ForegroundColor Green 
                }
                catch {
                    Write-Host (Get-Text "ClipboardError") $_.Exception.Message -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        13 { # Гибернация
            if (Confirm-Action -Message (Get-Text "HibernateMsg")) {
                try {
                    & powercfg.exe /hibernate on 2>$null
                    & reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v ShowHibernateOption /t REG_DWORD /d 1 /f 2>$null | Out-Null
                    Write-Host (Get-Text "HibernateEnabled") -ForegroundColor Green
                }
                catch {
                    Write-Host (Get-Text "HibernateError") $_.Exception.Message -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        14 { # Перезапуск проводника
            Write-Host "`n===" (Get-Text "RestartExplorerTitle") "===" -ForegroundColor Cyan
            Write-Host "`n" (Get-Text "RestartExplorerMsg") -ForegroundColor Yellow
            
            if (Confirm-Action -Message "Confirm Explorer restart?") {
                try {
                    Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
                    Start-Sleep -Seconds 2
                    Start-Process explorer.exe
                    Write-Host (Get-Text "ExplorerRestarted") -ForegroundColor Green
                }
                catch {
                    Write-Host (Get-Text "ExplorerError") $_.Exception.Message -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        15 { # Выход
            exit
        }
    }
} while ($true)
