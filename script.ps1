# Установка кодировки для корректного отображения текста
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

function Confirm-Action {
    param(
        [string]$Message,
        [string]$Question = "Продолжить? (Y/N): "
    )
    
    Write-Host "`n$Message" -ForegroundColor Yellow
    Write-Host $Question -ForegroundColor Cyan -NoNewline
    
    do {
        $key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        $response = $key.Character.ToString().ToLower()
        
        if ($response -eq 'y' -or $response -eq 'д') {
            Write-Host "`n"
            return $true
        }
        elseif ($response -eq 'n' -or $response -eq 'н') {
            Write-Host "`nДействие отменено" -ForegroundColor Yellow
            Start-Sleep -Seconds 1
            return $false
        }
    } while ($true)
}

function Show-Menu {
    param (
        [string]$Title = 'Настройка Windows (2026)',
        [array]$Options,
        [string]$BackOption = "Назад"
    )

    $selectedIndex = 0
    $key = $null

    while ($true) {
        Clear-Host
        Write-Host "=== $Title ===" -ForegroundColor Cyan
        Write-Host "Используйте стрелки ↑↓ и Enter для выбора" -ForegroundColor Yellow
        Write-Host "Нажмите 'Q' для выхода из программы`n" -ForegroundColor Yellow

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

function Show-ThemeMenu {
    $themeItems = @(
        "Включить тёмную тему",
        "Включить светлую тему (по умолчанию)",
        "Назад"
    )
    
    do {
        $themeChoice = Show-Menu -Title "Выбор темы" -Options $themeItems -BackOption "Назад"
        
        if ($themeChoice -eq "exit") {
            return "exit"
        }
        elseif ($themeChoice -eq "back") {
            return "back"
        }
        
        switch ($themeChoice) {
            0 { # Темная тема
                if (Confirm-Action -Message "Будет включена тёмная тема для системы и приложений.`nТребуется перезапуск Проводника.") {
                    try {
                        Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize" -Name "AppsUseLightTheme" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize" -Name "SystemUsesLightTheme" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\DWM" -Name "ColorPrevalence" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                        Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
                        Write-Host "Тёмная тема включена!" -ForegroundColor Green
                    }
                    catch {
                        Write-Host "Ошибка при настройке темы: $($_.ToString())" -ForegroundColor Red
                    }
                    Start-Sleep -Seconds 1
                }
                return "back"
            }
            1 { # Светлая тема
                if (Confirm-Action -Message "Будет включена светлая тема для системы и приложений.`nТребуется перезапуск Проводника.") {
                    try {
                        Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize" -Name "AppsUseLightTheme" -Value 1 -Type DWord -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize" -Name "SystemUsesLightTheme" -Value 1 -Type DWord -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\DWM" -Name "ColorPrevalence" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                        Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
                        Write-Host "Светлая тема включена!" -ForegroundColor Green
                    }
                    catch {
                        Write-Host "Ошибка при настройке темы: $($_.ToString())" -ForegroundColor Red
                    }
                    Start-Sleep -Seconds 1
                }
                return "back"
            }
            2 { # Назад
                return "back"
            }
        }
    } while ($true)
}

function Remove-DesktopShortcuts {
    Write-Host "`n=== УДАЛЕНИЕ ЯРЛЫКОВ С РАБОЧЕГО СТОЛА ===" -ForegroundColor Cyan
    
    $shortcutsToRemove = @(
        "Microsoft Edge.lnk",
        "Mail.lnk",
        "Store.lnk"
    )
    
    Write-Host "`nБудут удалены следующие ярлыки:" -ForegroundColor Yellow
    foreach ($shortcut in $shortcutsToRemove) {
        Write-Host "  • $shortcut" -ForegroundColor White
    }
    
    if (Confirm-Action -Message "`nВы уверены, что хотите удалить эти ярлыки?") {
        $removedCount = 0
        
        $desktopPaths = @("$env:Public\\Desktop", "$env:USERPROFILE\\Desktop")
        
        foreach ($desktopPath in $desktopPaths) {
            foreach ($shortcut in $shortcutsToRemove) {
                $fullPath = Join-Path $desktopPath $shortcut
                if (Test-Path $fullPath) {
                    try {
                        Remove-Item -Path $fullPath -Force -ErrorAction SilentlyContinue
                        Write-Host "Удалено: $shortcut" -ForegroundColor Green
                        $removedCount++
                    }
                    catch {
                        Write-Host "Не удалось удалить ${shortcut}: $($_.ToString())" -ForegroundColor Yellow
                    }
                }
            }
        }
        
        Write-Host "`nУдалено $removedCount ярлыков!" -ForegroundColor Green
    }
    Start-Sleep -Seconds 1
}

function Unpin-FromTaskbar {
    param(
        [string]$AppName,
        [string]$DisplayName
    )
    
    try {
        $shell = New-Object -ComObject Shell.Application
        $folder = $shell.Namespace("shell:::{4234d49b-0245-4df3-b780-3893943456e1}")
        
        $items = $folder.Items()
        $item = $items | Where-Object { $_.Name -match $AppName }
        
        if ($item) {
            $verbs = $item.Verbs()
            $unpinVerb = $verbs | Where-Object { 
                $_.Name.replace('&','') -match "Unpin from taskbar|Открепить от панели задач|Открепить от панели" 
            }
            
            if ($unpinVerb) {
                $unpinVerb.DoIt()
                Write-Host "  ✓ $DisplayName откреплен" -ForegroundColor Green
                return $true
            }
            else {
                Write-Host "  ⚠ Не найдена команда открепления для $DisplayName" -ForegroundColor Yellow
                return $false
            }
        }
        else {
            Write-Host "  ⚠ $DisplayName не найден на панели задач" -ForegroundColor Yellow
            return $false
        }
    }
    catch {
        Write-Host ("  ✗ Ошибка при откреплении {0}: {1}" -f $DisplayName, $_.ToString()) -ForegroundColor Red
        return $false
    }
}

function Unpin-AppsFromTaskbar {
    Write-Host "`n=== ОТКРЕПЛЕНИЕ ПРИЛОЖЕНИЙ ОТ ПАНЕЛИ ЗАДАЧ ===" -ForegroundColor Cyan
    
    $appsToUnpin = @(
        @{AppName = "Outlook"; DisplayName = "Outlook (Почта)"},
        @{AppName = "Microsoft Store"; DisplayName = "Microsoft Store"},
        @{AppName = "Microsoft Edge"; DisplayName = "Microsoft Edge"},
        @{AppName = "Weather"; DisplayName = "Погода"},
        @{AppName = "Xbox"; DisplayName = "Xbox"}
    )
    
    Write-Host "`nБудут откреплены следующие приложения:" -ForegroundColor Yellow
    foreach ($app in $appsToUnpin) {
        Write-Host "  • $($app.DisplayName)" -ForegroundColor White
    }
    
    if (Confirm-Action -Message "`nВы уверены, что хотите открепить эти приложения?") {
        $successCount = 0
        $totalCount = $appsToUnpin.Count
        
        Write-Host "`nПроцесс открепления:" -ForegroundColor Cyan
        
        foreach ($app in $appsToUnpin) {
            if (Unpin-FromTaskbar -AppName $app.AppName -DisplayName $app.DisplayName) {
                $successCount++
            }
            Start-Sleep -Milliseconds 300
        }
        
        Write-Host "`nОткреплено $successCount из $totalCount приложений" -ForegroundColor Green
    }
    Start-Sleep -Seconds 1
}

$mainMenuItems = @(
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

# Проверка на права администратора
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "`nВНИМАНИЕ: Для работы некоторых функций требуются права администратора!" -ForegroundColor Red
    Write-Host "Рекомендуется запустить скрипт от имени администратора.`n" -ForegroundColor Yellow
    Start-Sleep -Seconds 2
}

# Основной цикл программы
do {
    $choice = Show-Menu -Title "Главное меню" -Options $mainMenuItems
    
    if ($choice -eq "exit") {
        Write-Host "`nЗавершение работы..." -ForegroundColor Yellow
        Start-Sleep -Seconds 1
        exit
    }
    
    switch ($choice) {
        0 { # Поиск
            if (Confirm-Action -Message "Настройка панели поиска: будет установлен режим 'Иконка и текст'.") {
                try {
                    Set-ItemProperty -Path "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 3 -ErrorAction Stop
                    Write-Host "Панель поиска настроена: Иконка и текст!" -ForegroundColor Green 
                }
                catch {
                    Write-Host "Ошибка при настройке панели поиска: $($_.ToString())" -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        1 { # Активация
            Write-Host "`n=== АКТИВАЦИЯ WINDOWS ===" -ForegroundColor Cyan
            Write-Host "`nБудет запущен скрипт активации Windows через MAS (Microsoft Activation Scripts)" -ForegroundColor Yellow
            Write-Host "Источник: https://get.activated.win" -ForegroundColor Yellow
            
            if (Confirm-Action -Message "Вы уверены, что хотите активировать Windows?") {
                Write-Host "`nЗапуск активации Windows через MAS..." -ForegroundColor Yellow
                try {
                    Invoke-RestMethod -Uri "https://get.activated.win" | Invoke-Expression
                    Write-Host "Активация завершена!" -ForegroundColor Green
                }
                catch {
                    Write-Host "Ошибка при активации: $($_.ToString())" -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 2
        }
        2 { # Тема
            $themeResult = Show-ThemeMenu
            if ($themeResult -eq "exit") {
                exit
            }
        }
        3 { # Расширения
            if (Confirm-Action -Message "Проводник будет настроен на показ расширений файлов (например: .txt, .exe, .jpg).") {
                try {
                    & reg.exe add "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f | Out-Null
                    Write-Host "Расширения файлов теперь показываются!" -ForegroundColor Green 
                }
                catch {
                    Write-Host "Ошибка при настройке: $($_.ToString())" -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        4 { # Этот компьютер
            if (Confirm-Action -Message "Проводник будет открываться в разделе 'Этот компьютер' вместо 'Быстрого доступа'.") {
                try {
                    & reg.exe add "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f | Out-Null
                    Write-Host "Проводник теперь открывается в 'Этот компьютер'!" -ForegroundColor Green 
                }
                catch {
                    Write-Host "Ошибка при настройке: $($_.ToString())" -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        5 { # Скрытые папки
            if (Confirm-Action -Message "Будут показаны скрытые файлы и папки, включая защищенные системные файлы.") {
                try {
                    & reg.exe add "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced" /v Hidden /t REG_DWORD /d 1 /f | Out-Null
                    & reg.exe add "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced" /v ShowSuperHidden /t REG_DWORD /d 1 /f | Out-Null
                    Write-Host "Скрытые файлы и папки теперь показываются!" -ForegroundColor Green 
                }
                catch {
                    Write-Host "Ошибка при настройке: $($_.ToString())" -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        6 { # Удалить корзину с рабочего стола
            if (Confirm-Action -Message "Иконка корзины будет удалена с рабочего стола.`nДля применения изменений потребуется перезапуск проводника.") {
                try {
                    Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\HideDesktopIcons\\NewStartPanel" -Name "{645FF040-5081-101B-9F08-00AA002F954E}" -Value 1 -ErrorAction Stop
                    Write-Host "Корзина удалена с рабочего стола!" -ForegroundColor Green
                    Write-Host "Для применения изменений может потребоваться перезапуск проводника" -ForegroundColor Yellow
                }
                catch {
                    Write-Host "Ошибка при удалении корзины: $($_.ToString())" -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        7 { # Удалить ярлыки с рабочего стола
            Remove-DesktopShortcuts
        }
        8 { # Открепить приложения от панели задач
            Unpin-AppsFromTaskbar
        }
        9 { # Производительность
            if (Confirm-Action -Message "Будет добавлена схема электропитания 'Максимальная производительность'.") {
                try {
                    & powercfg.exe -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 2>$null
                    Write-Host "Схема 'Максимальная производительность' добавлена!" -ForegroundColor Green 
                }
                catch {
                    Write-Host "Ошибка при добавлении схемы питания: $($_.ToString())" -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        10 { # End Task
            if (Confirm-Action -Message "Будет добавлена опция 'Завершить задачу' в контекстное меню панели задач.") {
                try {
                    & reg.exe add "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\TaskbarDeveloperSettings" /v TaskbarEndTask /t REG_DWORD /d 1 /f | Out-Null
                    Write-Host "Опция 'Завершить задачу' включена на панели задач!" -ForegroundColor Green 
                }
                catch {
                    Write-Host "Ошибка при настройке: $($_.ToString())" -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        11 { # Больше плиток
            if (Confirm-Action -Message "Количество плиток в меню Пуск будет увеличено.") {
                try {
                    Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced" -Name "Start_Layout" -Value 1 -ErrorAction SilentlyContinue
                    Write-Host "Количество плиток в меню Пуск увеличено!" -ForegroundColor Green 
                }
                catch {
                    Write-Host "Ошибка при настройке: $($_.ToString())" -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        12 { # Буфер обмена
            if (Confirm-Action -Message "Будет включена история буфера обмена (Win+V).") {
                try {
                    if (!(Test-Path "HKCU:\\Software\\Microsoft\\Clipboard")) { 
                        New-Item -Path "HKCU:\\Software\\Microsoft\\Clipboard" -Force | Out-Null
                    }
                    Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Clipboard" -Name "CloudClipboardAndHistoryEnabled" -Value 1 -ErrorAction Stop
                    Write-Host "История буфера обмена включена!" -ForegroundColor Green 
                }
                catch {
                    Write-Host "Ошибка при настройке буфера обмена: $($_.ToString())" -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        13 { # Гибернация
            if (Confirm-Action -Message "Будет включена гибернация и добавлена опция в меню питания.`nКоманды:`n1. powercfg /hibernate on - включение гибернации`n2. Редактирование реестра для показа опции в меню") {
                try {
                    & powercfg.exe /hibernate on 2>$null
                    & reg.exe add "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\FlyoutMenuSettings" /v ShowHibernateOption /t REG_DWORD /d 1 /f 2>$null | Out-Null
                    Write-Host "Гибернация включена и опция добавлена в меню питания!" -ForegroundColor Green
                    Write-Host "Для применения изменений может потребоваться перезагрузка системы" -ForegroundColor Yellow
                }
                catch {
                    Write-Host "Ошибка при включении гибернации: $($_.ToString())" -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        14 { # Рестарт проводника
            Write-Host "`n=== ПЕРЕЗАПУСК ПРОВОДНИКА ===" -ForegroundColor Cyan
            Write-Host "`nБудет выполнен перезапуск Проводника Windows." -ForegroundColor Yellow
            Write-Host "Все открытые окна Проводника закроются и откроются заново." -ForegroundColor Yellow
            
            if (Confirm-Action -Message "Вы уверены, что хотите перезапустить Проводник?") {
                try {
                    Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
                    Start-Sleep -Seconds 2
                    Start-Process explorer.exe
                    Write-Host "Проводник перезапущен!" -ForegroundColor Green
                }
                catch {
                    Write-Host "Ошибка при перезапуске проводника: $($_.ToString())" -ForegroundColor Red
                }
            }
            Start-Sleep -Seconds 1
        }
        15 { # Выход
            Write-Host "`nЗавершение работы..." -ForegroundColor Yellow
            Start-Sleep -Seconds 1
            exit
        }
    }
} while ($true)
