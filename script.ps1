# Установка кодировки для корректного отображения текста
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Глобальные переменные для языка
$script:Language = "ru"  # По умолчанию русский
$script:Translations = @{
    "en" = @{
        "Title" = "Windows Setup (2026)"
        "UseArrows" = "Use ↑↓ arrows and Enter to select"
        "PressQ" = "Press 'Q' to exit"
        "Continue" = "Continue? (Y/N): "
        "Cancelled" = "Action cancelled"
        "DarkTheme" = "Enable dark theme"
        "LightTheme" = "Enable light theme (default)"
        "ThemeTitle" = "Theme Selection"
        "DarkThemeMsg" = "Dark theme will be enabled for system and apps.`nExplorer restart required."
        "LightThemeMsg" = "Light theme will be enabled for system and apps.`nExplorer restart required."
        "ThemeEnabled" = "Theme enabled!"
        "ThemeError" = "Theme setup error: "
        "RemoveShortcutsTitle" = "REMOVE DESKTOP SHORTCUTS"
        "ShortcutsList" = "Following shortcuts will be removed:"
        "ConfirmRemoveShortcuts" = "Are you sure you want to remove these shortcuts?"
        "Removed" = "Removed:"
        "RemoveShortcutsError" = "Failed to remove"
        "ShortcutsRemoved" = "shortcuts removed!"
        "UnpinTitle" = "UNPIN APPS FROM TASKBAR"
        "AppsList" = "Following apps will be unpinned:"
        "ConfirmUnpin" = "Are you sure you want to unpin these apps?"
        "UnpinProcess" = "Unpinning process:"
        "Unpinned" = "✓ unpinned"
        "NotFound" = "⚠ not found on taskbar"
        "NoUnpinCommand" = "⚠ No unpin command found for"
        "UnpinError" = "✗ Unpin error for"
        "AppsUnpinned" = "Apps unpinned out of"
        "SearchTitle" = "SEARCH BAR: ICON AND TEXT"
        "SearchSetup" = "Search bar will be set to 'Icon and text' mode."
        "SearchConfigured" = "Search bar configured: Icon and text!"
        "ActivationTitle" = "WINDOWS ACTIVATION"
        "ActivationMsg" = "Windows activation via MAS (Microsoft Activation Scripts) will be launched"
        "ActivationSource" = "Source: https://get.activated.win"
        "ConfirmActivation" = "Are you sure you want to activate Windows?"
        "ActivationRunning" = "Running Windows activation via MAS..."
        "ActivationDone" = "Activation completed!"
        "FileExtMsg" = "Explorer will show file extensions (.txt, .exe, .jpg)."
        "FileExtEnabled" = "File extensions now visible!"
        "ThisPC Msg" = "Explorer will open 'This PC' instead of 'Quick access'."
        "ThisPC Enabled" = "Explorer now opens 'This PC'!"
        "HiddenFilesMsg" = "Hidden files and folders will be shown, including protected system files."
        "HiddenFilesEnabled" = "Hidden files and folders now visible!"
        "RecycleBinMsg" = "Recycle Bin icon will be removed from desktop.`nExplorer restart may be required."
        "RecycleBinRemoved" = "Recycle Bin removed from desktop!"
        "PowerMsg" = "Power plan 'Ultimate Performance' will be added."
        "PowerAdded" = "Ultimate Performance power plan added!"
        "EndTaskMsg" = "'End Task' option will be added to taskbar context menu."
        "EndTaskEnabled" = "'End Task' option enabled on taskbar!"
        "StartTilesMsg" = "Number of Start menu tiles will be increased."
        "StartTilesEnabled" = "Start menu tiles count increased!"
        "ClipboardMsg" = "Clipboard history (Win+V) will be enabled."
        "ClipboardEnabled" = "Clipboard history enabled!"
        "HibernateMsg" = "Hibernate will be enabled and added to power menu.`nCommands:`n1. powercfg /hibernate on`n2. Registry edit for menu option"
        "HibernateEnabled" = "Hibernate enabled and added to power menu!"
        "RestartExplorerTitle" = "RESTART EXPLORER"
        "RestartExplorerMsg" = "Windows Explorer will be restarted.`nAll Explorer windows will close and reopen."
        "ExplorerRestarted" = "Explorer restarted!"
        "AdminWarning" = "WARNING: Some functions require administrator rights!"
        "RunAsAdmin" = "Recommended to run script as administrator."
        "SearchSetupError" = "Search bar setup error: "
        "FileExtError" = "File extensions setup error: "
        "ThisPCError" = "This PC setup error: "
        "HiddenError" = "Hidden files setup error: "
        "RecycleError" = "Recycle Bin removal error: "
        "PowerError" = "Power plan setup error: "
        "EndTaskError" = "End Task setup error: "
        "StartTilesError" = "Start tiles setup error: "
        "ClipboardError" = "Clipboard setup error: "
        "HibernateError" = "Hibernate setup error: "
        "ExplorerError" = "Explorer restart error: "
        "ActivationError" = "Activation error: "
    }
    "ru" = @{
        "Title" = "Windows Setup (2026)"
        "UseArrows" = "Используйте стрелки ↑↓ и Enter для выбора"
        "PressQ" = "Нажмите 'Q' для выхода из программы"
        "Continue" = "Продолжить? (Y/N): "
        "Cancelled" = "Действие отменено"
        "DarkTheme" = "Включить тёмную тему"
        "LightTheme" = "Включить светлую тему (по умолчанию)"
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
        "SearchTitle" = "Панель Поиска: Иконка и текст"
        "SearchSetup" = "Настройка панели поиска: будет установлен режим 'Иконка и текст'."
        "SearchConfigured" = "Панель поиска настроена: Иконка и текст!"
        "ActivationTitle" = "АКТИВАЦИЯ WINDOWS"
        "ActivationMsg" = "Будет запущен скрипт активации Windows через MAS (Microsoft Activation Scripts)"
        "ActivationSource" = "Источник: https://get.activated.win"
        "ConfirmActivation" = "Вы уверены, что хотите активировать Windows?"
        "ActivationRunning" = "Запуск активации Windows через MAS..."
        "ActivationDone" = "Активация завершена!"
        "FileExtMsg" = "Проводник будет настроен на показ расширений файлов (например: .txt, .exe, .jpg)."
        "FileExtEnabled" = "Расширения файлов теперь показываются!"
        "ThisPC Msg" = "Проводник будет открываться в разделе 'Этот компьютер' вместо 'Быстрого доступа'."
        "ThisPC Enabled" = "Проводник теперь открывается в 'Этот компьютер'!"
        "HiddenFilesMsg" = "Будут показаны скрытые файлы и папки, включая защищенные системные файлы."
        "HiddenFilesEnabled" = "Скрытые файлы и папки теперь показываются!"
        "RecycleBinMsg" = "Иконка корзины будет удалена с рабочего стола.`nДля применения изменений потребуется перезапуск проводника."
        "RecycleBinRemoved" = "Корзина удалена с рабочего стола!"
        "PowerMsg" = "Будет добавлена схема электропитания 'Максимальная производительность'."
        "PowerAdded" = "Схема 'Максимальная производительность' добавлена!"
        "EndTaskMsg" = "Будет добавлена опция 'Завершить задачу' в контекстное меню панели задач."
        "EndTaskEnabled" = "Опция 'Завершить задачу' включена на панели задач!"
        "StartTilesMsg" = "Количество плиток в меню Пуск будет увеличено."
        "StartTilesEnabled" = "Количество плиток в меню Пуск увеличено!"
        "ClipboardMsg" = "Будет включена история буфера обмена (Win+V)."
        "ClipboardEnabled" = "История буфера обмена включена!"
        "HibernateMsg" = "Будет включена гибернация и добавлена опция в меню питания.`nКоманды:`n1. powercfg /hibernate on - включение гибернации`n2. Редактирование реестра для показа опции в меню"
        "HibernateEnabled" = "Гибернация включена и опция добавлена в меню питания!"
        "RestartExplorerTitle" = "ПЕРЕЗАПУСК ПРОВОДНИКА"
        "RestartExplorerMsg" = "Будет выполнен перезапуск Проводника Windows.`nВсе открытые окна Проводника закроются и откроются заново."
        "ExplorerRestarted" = "Проводник перезапущен!"
        "AdminWarning" = "ВНИМАНИЕ: Для работы некоторых функций требуются права администратора!"
        "RunAsAdmin" = "Рекомендуется запустить скрипт от имени администратора."
        "SearchSetupError" = "Ошибка при настройке панели поиска: "
        "FileExtError" = "Ошибка при настройке: "
        "ThisPCError" = "Ошибка при настройке: "
        "HiddenError" = "Ошибка при настройке: "
        "RecycleError" = "Ошибка при удалении корзины: "
        "PowerError" = "Ошибка при добавлении схемы питания: "
        "EndTaskError" = "Ошибка при настройке: "
        "StartTilesError" = "Ошибка при настройке: "
        "ClipboardError" = "Ошибка при настройке буфера обмена: "
        "HibernateError" = "Ошибка при включении гибернации: "
        "ExplorerError" = "Ошибка при перезапуске проводника: "
        "ActivationError" = "Ошибка при активации: "
    }
}

function Get-Text {
    param([string]$Key)
    return $script:Translations[$script:Language][$Key]
}

function Confirm-Action {
    param(
        [string]$Message,
        [string]$Question = $null
    )
    
    Write-Host "`n$Message" -ForegroundColor Yellow
    if ($Question) {
        Write-Host $Question -ForegroundColor Cyan -NoNewline
    } else {
        Write-Host (Get-Text "Continue") -ForegroundColor Cyan -NoNewline
    }
    
    do {
        $key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        $response = $key.Character.ToString().ToLower()
        
        if ($response -eq 'y' -or $response -eq 'д' -or $response -eq 'я') {
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
    param (
        [string]$Title = (Get-Text "Title"),
        [array]$Options,
        [string]$BackOption = "Back/Назад"
    )

    $selectedIndex = 0
    $key = $null

    while ($true) {
        Clear-Host
        Write-Host "=== $Title ===" -ForegroundColor Cyan
        Write-Host (Get-Text "UseArrows") -ForegroundColor Yellow
        Write-Host (Get-Text "PressQ") "`n" -ForegroundColor Yellow

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
        "English (EN)",
        "Русский (RU)",
        "Back/Назад"
    )
    
    do {
        $langChoice = Show-Menu -Title "Language/Language" -Options $langItems -BackOption "Back/Назад"
        
        if ($langChoice -eq "exit") {
            return "exit"
        }
        elseif ($langChoice -eq "back") {
            return "back"
        }
        elseif ($langChoice -eq 0) {
            $script:Language = "en"
            Write-Host "Language changed to English!" -ForegroundColor Green
            Start-Sleep -Seconds 1
            return "back"
        }
        elseif ($langChoice -eq 1) {
            $script:Language = "ru"
            Write-Host "Язык изменён на Русский!" -ForegroundColor Green
            Start-Sleep -Seconds 1
            return "back"
        }
    } while ($true)
}

# Остальные функции остаются такими же, но используют Get-Text для переводов
function Show-ThemeMenu {
    $themeItems = @(
        (Get-Text "DarkTheme"),
        (Get-Text "LightTheme"),
        "Back/Назад"
    )
    
    do {
        $themeChoice = Show-Menu -Title (Get-Text "ThemeTitle") -Options $themeItems -BackOption "Back/Назад"
        
        if ($themeChoice -eq "exit") {
            return "exit"
        }
        elseif ($themeChoice -eq "back") {
            return "back"
        }
        
        switch ($themeChoice) {
            0 { 
                if (Confirm-Action -Message (Get-Text "DarkThemeMsg")) {
                    try {
                        Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize" -Name "AppsUseLightTheme" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize" -Name "SystemUsesLightTheme" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\DWM" -Name "ColorPrevalence" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                        Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
                        Write-Host (Get-Text "ThemeEnabled") -ForegroundColor Green
                    }
                    catch {
                        Write-Host (Get-Text "ThemeError") $_.ToString() -ForegroundColor Red
                    }
                    Start-Sleep -Seconds 1
                }
                return "back"
            }
            1 { 
                if (Confirm-Action -Message (Get-Text "LightThemeMsg")) {
                    try {
                        Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize" -Name "AppsUseLightTheme" -Value 1 -Type DWord -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize" -Name "SystemUsesLightTheme" -Value 1 -Type DWord -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\DWM" -Name "ColorPrevalence" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                        Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
                        Write-Host (Get-Text "ThemeEnabled") -ForegroundColor Green
                    }
                    catch {
                        Write-Host (Get-Text "ThemeError") $_.ToString() -ForegroundColor Red
                    }
                    Start-Sleep -Seconds 1
                }
                return "back"
            }
        }
    } while ($true)
}

# Обновленные меню пункты с поддержкой обоих языков
function Get-MainMenuItems {
    if ($script:Language -eq "en") {
        return @(
            "Language (EN/RU)",
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
        return @(
            "Язык (EN/RU)",
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
}

# Функции Remove-DesktopShortcuts, Unpin-AppsFromTaskbar и другие остаются такими же
# но используют Get-Text для всех текстовых сообщений...

# Проверка на права администратора
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "`n" (Get-Text "AdminWarning") -ForegroundColor Red
    Write-Host (Get-Text "RunAsAdmin") "`n" -ForegroundColor Yellow
    Start-Sleep -Seconds 2
}

# Основной цикл программы
do {
    $mainMenuItems = Get-MainMenuItems
    $choice = Show-Menu -Title (Get-Text "Title") -Options $mainMenuItems
    
    if ($choice -eq "exit") {
        Write-Host "`nЗавершение работы... / Exiting..." -ForegroundColor Yellow
        Start-Sleep -Seconds 1
        exit
    }
    
    switch ($choice) {
        0 { # Язык / Language
            $langResult = Show-LanguageMenu
            if ($langResult -eq "exit") {
                exit
            }
        }
        # Остальные пункты меню используют аналогичный подход...
        # (для краткости показываю только структуру)
        1 { # Поиск / Search
            if (Confirm-Action -Message (Get-Text "SearchSetup")) {
                try {
                    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 3 -ErrorAction Stop
                    Write-Host (Get-Text "SearchConfigured") -ForegroundColor Green 
                }
                catch {
                    Write-Host (Get-Text "SearchSetupError") $_.ToString() -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        # ... остальные case'ы аналогично используют Get-Text
    }
} while ($true)
