#!/bin/bash
# =========================================
# СКРИПТ УСТАНОВКИ ДЛЯ ARCH LINUX
# С поддержкой русского и английского языков
# =========================================

# Цвета для вывода (фиолетово-бело-серая гамма)
PURPLE='\033[0;35m'       # Фиолетовый - основной цвет
LIGHT_PURPLE='\033[1;95m' # Светло-фиолетовый (яркий)
WHITE='\033[1;37m'        # Белый - заголовки
BLACK='\033[0;30m'        # Черный - фон (не используется напрямую)
GRAY='\033[0;37m'         # Серый - обычный текст
DARK_GRAY='\033[1;90m'    # Темно-серый (светлее)
LIGHT_GRAY='\033[0;97m'   # Светло-серый (яркий)
CYAN='\033[0;36m'         # Бирюзовый - информационные сообщения
LIGHT_CYAN='\033[1;96m'   # Светло-бирюзовый
NC='\033[0m'              # Сброс цвета

# Альтернативные варианты для контраста
PURPLE_ALT='\033[38;5;141m'    # Яркий фиолетовый
PURPLE_DARK='\033[38;5;99m'    # Фиолетовый (светлее чем было)
GRAY_LIGHT='\033[38;5;252m'    # Светло-серый
GRAY_DARK='\033[38;5;245m'     # Темно-серый (светлее)

# =========================================
# Глобальные переменные для текста
declare -A messages_ru messages_en current_messages LANGUAGE=""


# Русские тексты
messages_ru=(
    ["title"]="СКРИПТ УСТАНОВКИ ДЛЯ ARCH LINUX"
    ["welcome"]="Добро пожаловать в скрипт установки Arch Linux"
    ["choose_lang"]="Выберите язык / Select language:"
    ["lang_ru"]="Русский"
    ["lang_en"]="English"
    ["invalid_choice"]="Неверный выбор! Попробуйте снова."
    ["root_warning"]="Внимание: Не рекомендуется запускать скрипт от пользователя root."
    ["run_as_user"]="Запустите скрипт от обычного пользователя с правами sudo."
    ["update_system"]="Обновление системы..."
    ["system_updated"]="Система обновлена!"
    ["recommended_update"]="Рекомендуется обновить систему перед установкой"
    ["update_now"]="Обновить систему? (y/N): "
    ["install_apps"]="ВЫБОР И УСТАНОВКА ПРИЛОЖЕНИЙ"
    ["check_yay"]="Проверка и установка yay (AUR Helper)..."
    ["yay_not_found"]="yay не найден. Начинаю установку..."
    ["install_deps"]="Устанавливаю зависимости: base-devel, git..."
    ["clone_yay"]="Клонирую репозиторий yay из AUR..."
    ["build_yay"]="Собираю и устанавливаю yay..."
    ["yay_installed"]="yay успешно установлен!"
    ["yay_exists"]="yay уже установлен. Пропускаю."
    ["installing_via"]="Устанавливаю через"
    ["installed_success"]="установлен успешно!"
    ["already_installed"]="уже установлен"
    ["install_error"]="Ошибка при установки"
    ["gnome_install"]="Установка окружения GNOME..."
    ["update_before"]="Обновляю систему..."
    ["installing_xorg"]="Устанавливаю Xorg..."
    ["installing_gnome"]="Устанавливаю GNOME..."
    ["setup_gdm"]="Устанавливаю и настраиваю GDM..."
    ["gnome_installed"]="Окружение GNOME установлено!"
    ["reboot_required"]="Перезагрузите систему для применения изменений"
    ["hyprland_install"]="Установка окружения Hyprland..."
    ["installing_hyprland"]="Устанавливаю Hyprland..."
    ["installing_wayland"]="Устанавливаю Wayland компоненты..."
    ["setup_display_manager"]="Настраиваю вход в систему..."
    ["hyprland_installed"]="Окружение Hyprland установлено!"
    ["hyprland_note"]="После входа в систему используйте команду: Hyprland"
    ["complete_install"]="Полная установка GNOME с приложениями..."
    ["more_actions"]="Хотите выполнить ещё действия? (y/N): "
    ["installation_complete"]="Установка завершена!"
    ["gdm_detected"]="Обнаружен GDM. Для запуска графической среды необходима перезагрузка."
    ["reboot_now"]="Перезагрузить сейчас? (y/N): "
    ["exit_script"]="Выход..."
    ["main_menu"]="Установка окружения и программ"
    ["menu_gnome"]="Установить GNOME"
    ["menu_apps"]="Выбрать и установить приложения"
    ["menu_hyprland"]="Установить Hyprland (окружение Wayland)"
    ["menu_update"]="Только обновить систему"
    ["menu_clean_gnome"]="Очистка GNOME (удаление ненужных программ)"
    ["menu_dock_pin"]="Закрепить приложения в Dock"
    ["menu_touchpad_right_click"]="Добавить ПКМ для тачпада (зоны)"
    ["menu_keyboard_layout"]="Настроить переключение раскладки (Alt+Shift)"
    ["menu_fish_config"]="Установить конфиг Fish Shell"
    ["menu_exit"]="Выход"
    ["select_option"]="Выберите вариант"
    ["bitwarden"]="Bitwarden (менеджер паролей)"
    ["chrome"]="Google Chrome (браузер)"
    ["zen_browser"]="Zen Browser (браузер на базе Firefox)"
    ["browsers"]="Браузеры"
    ["telegram_desktop"]="Telegram Desktop (мессенджер)"
    ["discord"]="Discord (мессенджер для геймеров)"
    ["vencord"]="Vencord (модификация Discord)"
    ["messengers"]="Мессенджеры"
    ["speedtest"]="Speedtest CLI (скорость интернета)"
    ["onlyoffice"]="OnlyOffice (офисный пакет)"
    ["jetbrains"]="JetBrains Toolbox (менеджер IDE)"
    ["recommended_toolbox"]="Рекомендуется установить JetBrains Toolbox для управления IDE"
    ["install_toolbox"]="Установить JetBrains Toolbox? (y/N): "
    ["after_toolbox"]="После запуска Toolbox установите нужные IDE."
    ["activation_warning"]="Внимание: Автоматическая активация через ckey.run может быть небезопасной."
    ["consider_license"]="Рассмотрите официальные лицензии или альтернативные способы."
    ["qbittorrent"]="qBittorrent (торрент-клиент)"
    ["steam"]="Steam (игровая платформа)"
    ["portproton"]="PortProton (запуск Windows игр)"
    ["games"]="Игры"
    ["enable_multilib"]="Включаю репозиторий multilib для Steam..."
    ["multilib_warning"]="Внимание: Multilib не включен в /etc/pacman.conf"
    ["multilib_required"]="Для установки Steam необходимо раскомментировать [multilib] в /etc/pacman.conf"
    ["wallpaper"]="Linux Wallpaper Engine (анимированные обои)"
    ["yandex_music"]="Яндекс.Музыка (музыкальный клиент)"
    ["nodejs_deps"]="Установка зависимости: nodejs-lts..."
    ["soundcloud"]="SoundCloud-dl (скачивание музыки)"
    ["obs"]="OBS Studio (запись экрана)"
    ["zerotier"]="Zerotier One (VPN сеть)"
    ["zerotier_enabled"]="Zerotier служба включена и запущена"
    ["widgets"]="Терминальные виджеты (cava, cmatrix, tty-clock)"
    ["press_enter"]="Нажмите Enter для продолжения..."
    ["select_category"]="Выберите вариант [1-5]: "
    ["enable_zerotier"]="Zerotier служба включена и запущена"
    ["app_selection"]="ВЫБЕРИТЕ ПРИЛОЖЕНИЯ ДЛЯ УСТАНОВКИ"
    ["instructions_single"]="↑↓ - перемещение, ПРОБЕЛ/ENTER - подтвердить"
    ["instructions_multi"]="↑↓ - перемещение, ПРОБЕЛ - выбрать/снять, ENTER - подтвердить"
    ["select_all"]="ВЫБРАТЬ/ОТМЕНИТЬ ВСЕ"
    ["selected_apps"]="Выбранные приложения"
    ["no_apps_selected"]="Не выбрано ни одного приложения!"
    ["continue_anyway"]="Продолжить без установки? (y/N): "
    ["installing_selected"]="Устанавливаю выбранные приложения..."
    ["app_done"]="Готово!"
    ["total_apps"]="Всего приложений"
    ["to_install"]="для установки"
    ["obsidian"]="Obsidian (заметки на базе Markdown)"
    ["vscode"]="Visual Studio Code (редактор кода)"
    ["development"]="Разработка"
    ["filezilla"]="FileZilla (FTP-клиент)"
    ["rustdesk"]="RustDesk (удаленный доступ)"
    ["remote"]="Удаленный доступ"
    ["pgadmin"]="pgAdmin 4 (управление PostgreSQL)"
    ["postgresql"]="PostgreSQL (база данных)"
    ["mysql_server"]="MySQL Server (сервер базы данных)"
    ["database"]="Базы данных"
    ["ventoy"]="Ventoy (создание загрузочных USB)"
    ["gparted"]="GParted (редактор разделов)"
    ["system_tools"]="Системные утилиты"
    ["krita"]="Krita (графический редактор)"
    ["graphics"]="Графика"
    ["openrazer"]="OpenRazer (поддержка устройств Razer)"
    ["winscribe"]="WindScribe (VPN клиент)"
    ["vpn"]="VPN клиенты"
    ["elyprism"]="ElyPrism Launcher (лаунчер Minecraft)"
    ["prism_launcher"]="Prism Launcher (альтернативный лаунчер Minecraft)"
    ["minecraft"]="Лаунчеры Minecraft"
    ["notes"]="Заметки"
    ["additional_apps"]="Дополнительные приложения"
    ["games_launchers"]="Игры и лаунчеры"
    ["network"]="Сеть и VPN"
    ["neovim"]="Neovim (современный редактор Vim)"
    ["tabby"]="Tabby Terminal (современный терминал)"
    ["clean_gnome"]="Очистка GNOME (удаление ненужных программ)"
    ["clean_gnome_desc"]="Выберите программы GNOME для удаления"
    ["removing_selected"]="Удаляю выбранные программы..."
    ["removed_success"]="удален успешно!"
    ["already_removed"]="не установлен или уже удален"
    ["remove_error"]="Ошибка при удаления"
    ["removing_via"]="Удаляю через"
    ["clean_warning"]="ВНИМАНИЕ: Это удалит выбранные программы безвозвратно"
    ["clean_confirm"]="Продолжить с удалением? (y/N): "
    ["clean_complete"]="Очистка GNOME завершена!"
    ["app_dconf_editor"]="Dconf Editor (редактор конфигураций)"
    ["app_gnome_contacts"]="GNOME Contacts (контакты)"
    ["app_gnome_maps"]="GNOME Maps (карты)"
    ["app_gnome_calls"]="GNOME Calls (звонки)"
    ["app_gnome_music"]="GNOME Music (музыка)"
    ["app_gnome_text_editor"]="GNOME Text Editor (текстовый редактор)"
    ["app_ghex"]="Ghex (шестнадцатеричный редактор)"
    ["app_epiphany"]="Epiphany (веб-браузер)"
    ["app_gnome_tour"]="GNOME Tour (обзор системы)"
    ["app_evince"]="Evince (просмотр PDF)"
    ["app_sushi"]="Sushi (быстрый просмотр файлов)"
    ["app_gnome_characters"]="GNOME Characters (таблица символов)"
    ["app_mpv"]="MPV (медиаплеер)"
    ["app_linux_wallpaper"]="Linux Wallpaper Engine (анимированные обои)"
    ["dock_pin"]="Закрепить приложения в Dock"
    ["dock_pin_desc"]="Автоматическое закрепление приложений в GNOME Dock"
    ["dock_pin_script"]="Скрипт закрепления приложений в Dock"
    ["dock_pin_success"]="Приложения закреплены в Dock!"
    ["touchpad_right_click"]="Добавить ПКМ для тачпада"
    ["touchpad_right_click_desc"]="Включение зон тачпада для правого клика (правый нижний угол)"
    ["touchpad_enabled"]="Настройки тачпада применены!"
    ["touchpad_info"]="Теперь можно кликать правой кнопкой в правом нижнем углу тачпада"
    ["keyboard_layout"]="Настройка переключения раскладки"
    ["keyboard_layout_desc"]="Установка Alt+Shift для переключения раскладки клавиатуры"
    ["keyboard_layout_success"]="Настройки раскладки применены!"
    ["keyboard_layout_info"]="Теперь можно переключать раскладку клавиатуры с помощью Alt+Shift"
    ["fish_config"]="Установка конфига Fish Shell"
    ["fish_config_desc"]="Скачать config.fish из GitHub"
    ["fish_downloading"]="Скачиваю config.fish из репозитория..."
    ["fish_success"]="Конфиг Fish успешно установлен!"
    ["fish_error"]="Ошибка при скачивании конфига"
    ["fish_info"]="Файл сохранён в ~/.config/fish/config.fish"
    ["fish_restart"]="Перезапустите терминал для применения"
)


# Английские тексты
messages_en=(
    ["title"]="ARCH LINUX INSTALLATION SCRIPT"
    ["welcome"]="Welcome to Arch Linux installation script"
    ["choose_lang"]="Select language:"
    ["lang_ru"]="Russian"
    ["lang_en"]="English"
    ["invalid_choice"]="Invalid choice! Please try again."
    ["root_warning"]="Warning: It is not recommended to run the script as root user."
    ["run_as_user"]="Please run the script as a regular user with sudo privileges."
    ["update_system"]="Updating system..."
    ["system_updated"]="System updated!"
    ["recommended_update"]="It is recommended to update the system before installation"
    ["update_now"]="Update system now? (y/N): "
    ["install_apps"]="APPLICATION SELECTION AND INSTALLATION"
    ["check_yay"]="Checking and installing yay (AUR Helper)..."
    ["yay_not_found"]="yay not found. Starting installation..."
    ["install_deps"]="Installing dependencies: base-devel, git..."
    ["clone_yay"]="Cloning yay repository from AUR..."
    ["build_yay"]="Building and installing yay..."
    ["yay_installed"]="yay successfully installed!"
    ["yay_exists"]="yay is already installed. Skipping."
    ["installing_via"]="Installing via"
    ["installed_success"]="installed successfully!"
    ["already_installed"]="is already installed"
    ["install_error"]="Error installing"
    ["gnome_install"]="Installing GNOME environment..."
    ["update_before"]="Updating system..."
    ["installing_xorg"]="Installing Xorg..."
    ["installing_gnome"]="Installing GNOME..."
    ["setup_gdm"]="Installing and configuring GDM..."
    ["gnome_installed"]="GNOME environment installed!"
    ["reboot_required"]="Reboot the system to apply changes"
    ["hyprland_install"]="Installing Hyprland environment..."
    ["installing_hyprland"]="Installing Hyprland..."
    ["installing_wayland"]="Installing Wayland components..."
    ["setup_display_manager"]="Setting up login manager..."
    ["hyprland_installed"]="Hyprland environment installed!"
    ["hyprland_note"]="After login, use command: Hyprland"
    ["complete_install"]="Full GNOME installation with applications..."
    ["more_actions"]="Perform more actions? (y/N): "
    ["installation_complete"]="Installation complete!"
    ["gdm_detected"]="GDM detected. Reboot is required to start graphical environment."
    ["reboot_now"]="Reboot now? (y/N): "
    ["exit_script"]="Exiting..."
    ["main_menu"]="Environment and Applications Installation"
    ["menu_gnome"]="Install GNOME"
    ["menu_apps"]="Select and install applications"
    ["menu_hyprland"]="Install Hyprland (Wayland environment)"
    ["menu_update"]="Update system only"
    ["menu_clean_gnome"]="Clean GNOME (remove unnecessary programs)"
    ["menu_dock_pin"]="Pin applications to Dock"
    ["menu_touchpad_right_click"]="Add right click for touchpad (zones)"
    ["menu_keyboard_layout"]="Configure keyboard layout switching (Alt+Shift)"
    ["menu_fish_config"]="Install Fish Shell config"
    ["menu_exit"]="Exit"
    ["select_option"]="Select option"
    ["bitwarden"]="Bitwarden (password manager)"
    ["chrome"]="Google Chrome (browser)"
    ["zen_browser"]="Zen Browser (Firefox-based browser)"
    ["browsers"]="Browsers"
    ["telegram_desktop"]="Telegram Desktop (messenger)"
    ["discord"]="Discord (gaming messenger)"
    ["vencord"]="Vencord (Discord mod)"
    ["messengers"]="Messengers"
    ["speedtest"]="Speedtest CLI (internet speed)"
    ["onlyoffice"]="OnlyOffice (office suite)"
    ["jetbrains"]="JetBrains Toolbox (IDE manager)"
    ["recommended_toolbox"]="It is recommended to install JetBrains Toolbox for IDE management"
    ["install_toolbox"]="Install JetBrains Toolbox? (y/N): "
    ["after_toolbox"]="After launching Toolbox, install the required IDEs."
    ["activation_warning"]="Warning: Automatic activation via ckey.run may be unsafe."
    ["consider_license"]="Consider official licenses or alternative methods."
    ["qbittorrent"]="qBittorrent (torrent client)"
    ["steam"]="Steam (gaming platform)"
    ["portproton"]="PortProton (Windows games)"
    ["games"]="Games"
    ["enable_multilib"]="Enabling multilib repository for Steam..."
    ["multilib_warning"]="Warning: Multilib is not enabled in /etc/pacman.conf"
    ["multilib_required"]="To install Steam, you need to uncomment [multilib] in /etc/pacman.conf"
    ["wallpaper"]="Linux Wallpaper Engine (animated wallpapers)"
    ["yandex_music"]="Yandex.Music (music client)"
    ["nodejs_deps"]="Installing dependency: nodejs-lts..."
    ["soundcloud"]="SoundCloud-dl (music downloader)"
    ["obs"]="OBS Studio (screen recording)"
    ["zerotier"]="Zerotier One (VPN network)"
    ["zerotier_enabled"]="Zerotier service enabled and started"
    ["widgets"]="Terminal widgets (cava, cmatrix, tty-clock)"
    ["press_enter"]="Press Enter to continue..."
    ["select_category"]="Select option [1-5]: "
    ["enable_zerotier"]="Zerotier service enabled and started"
    ["app_selection"]="SELECT APPLICATIONS TO INSTALL"
    ["instructions_single"]="↑↓ - navigate, SPACE/ENTER - confirm"
    ["instructions_multi"]="↑↓ - navigate, SPACE - select/deselect, ENTER - confirm"
    ["select_all"]="SELECT/DESELECT ALL"
    ["selected_apps"]="Selected applications"
    ["no_apps_selected"]="No applications selected!"
    ["continue_anyway"]="Continue without installation? (y/N): "
    ["installing_selected"]="Installing selected applications..."
    ["app_done"]="Done!"
    ["total_apps"]="Total applications"
    ["to_install"]="to install"
    ["obsidian"]="Obsidian (Markdown notes)"
    ["vscode"]="Visual Studio Code (code editor)"
    ["development"]="Development"
    ["filezilla"]="FileZilla (FTP client)"
    ["rustdesk"]="RustDesk (remote access)"
    ["remote"]="Remote access"
    ["pgadmin"]="pgAdmin 4 (PostgreSQL management)"
    ["postgresql"]="PostgreSQL (database)"
    ["mysql_server"]="MySQL Server (database server)"
    ["database"]="Databases"
    ["ventoy"]="Ventoy (bootable USB creator)"
    ["gparted"]="GParted (partition editor)"
    ["system_tools"]="System tools"
    ["krita"]="Krita (graphics editor)"
    ["graphics"]="Graphics"
    ["openrazer"]="OpenRazer (Razer device support)"
    ["winscribe"]="WindScribe (VPN client)"
    ["vpn"]="VPN clients"
    ["elyprism"]="ElyPrism Launcher (Minecraft launcher)"
    ["prism_launcher"]="Prism Launcher (alternative Minecraft launcher)"
    ["minecraft"]="Minecraft launchers"
    ["notes"]="Notes"
    ["additional_apps"]="Additional applications"
    ["games_launchers"]="Games and launchers"
    ["network"]="Network and VPN"
    ["neovim"]="Neovim (modern Vim editor)"
    ["tabby"]="Tabby Terminal (modern terminal)"
    ["clean_gnome"]="Clean GNOME (remove unnecessary programs)"
    ["clean_gnome_desc"]="Select GNOME programs to remove"
    ["removing_selected"]="Removing selected programs..."
    ["removed_success"]="removed successfully!"
    ["already_removed"]="not installed or already removed"
    ["remove_error"]="Error removing"
    ["removing_via"]="Removing via"
    ["clean_warning"]="WARNING: This will permanently remove selected programs"
    ["clean_confirm"]="Continue with removal? (y/N): "
    ["clean_complete"]="GNOME cleanup completed!"
    ["app_dconf_editor"]="Dconf Editor (configuration editor)"
    ["app_gnome_contacts"]="GNOME Contacts (contacts)"
    ["app_gnome_maps"]="GNOME Maps (maps)"
    ["app_gnome_calls"]="GNOME Calls (calls)"
    ["app_gnome_music"]="GNOME Music (music player)"
    ["app_gnome_text_editor"]="GNOME Text Editor (text editor)"
    ["app_ghex"]="Ghex (hex editor)"
    ["app_epiphany"]="Epiphany (web browser)"
    ["app_gnome_tour"]="GNOME Tour (system tour)"
    ["app_evince"]="Evince (PDF viewer)"
    ["app_sushi"]="Sushi (quick file preview)"
    ["app_gnome_characters"]="GNOME Characters (character map)"
    ["app_mpv"]="MPV (media player)"
    ["app_linux_wallpaper"]="Linux Wallpaper Engine (animated wallpapers)"
    ["dock_pin"]="Pin applications to Dock"
    ["dock_pin_desc"]="Automatic pinning of applications to GNOME Dock"
    ["dock_pin_script"]="Application pinning script to Dock"
    ["dock_pin_success"]="Applications pinned to Dock!"
    ["touchpad_right_click"]="Add right click for touchpad"
    ["touchpad_right_click_desc"]="Enable touchpad zones for right click (bottom right corner)"
    ["touchpad_enabled"]="Touchpad settings applied!"
    ["touchpad_info"]="Now you can right-click in the bottom right corner of the touchpad"
    ["keyboard_layout"]="Keyboard layout switching"
    ["keyboard_layout_desc"]="Setting Alt+Shift for keyboard layout switching"
    ["keyboard_layout_success"]="Keyboard layout settings applied!"
    ["keyboard_layout_info"]="Now you can switch keyboard layout using Alt+Shift"
    ["fish_config"]="Installing Fish Shell config"
    ["fish_config_desc"]="Download config.fish from GitHub"
    ["fish_downloading"]="Downloading config.fish from repository..."
    ["fish_success"]="Fish config successfully installed!"
    ["fish_error"]="Error downloading config"
    ["fish_info"]="File saved to ~/.config/fish/config.fish"
    ["fish_restart"]="Restart terminal to apply changes"
)


print_message() {
    local key="$1"
    local color="${2:-$WHITE}"
    local text="${current_messages[$key]:-$key}"
    echo -e "${color}${text}${NC}"
}


get_message() {
    local key="$1"
    echo "${current_messages[$key]:-$key}"
}


interactive_menu() {
    local mode="$1"
    local -n items="$2"
    local callback="$3"

    local total="${#items[@]}"
    local current_selection=0
    local -a selected_indices=()
    for ((i=0; i<total; i++)); do
        selected_indices[$i]=0
    done

    local old_stty
    old_stty=$(stty -g)
    stty -echo -icanon min 1 time 0

    while true; do
        clear
        echo -e "${PURPLE_DARK}╔═════════════════════════════════════╗${NC}"
        echo -e "${PURPLE_DARK}║$(printf "%*s" -33 "$(get_message "${mode}_title")")║${NC}"
        echo -e "${PURPLE_DARK}╚═════════════════════════════════════╝${NC}"
        
        if [[ $mode == "single" ]]; then
            echo -e "${GRAY_DARK}┌─────────────────────────────────────────┐${NC}"
            echo -e "${GRAY_DARK}│ $(get_message "instructions_single") │${NC}"
            echo -e "${GRAY_DARK}└─────────────────────────────────────────┘${NC}"
        else
            echo -e "${GRAY_DARK}┌─────────────────────────────────────────┐${NC}"
            echo -e "${GRAY_DARK}│ $(get_message "instructions_multi") │${NC}"
            echo -e "${GRAY_DARK}└─────────────────────────────────────────┘${NC}"
        fi
        
        echo -e "${DARK_GRAY}  Q - вернуться назад${NC}"
        echo -e "${PURPLE_DARK}╔═════════════════════════════════════╗${NC}"

        for ((i=0; i<total; i++)); do
            local prefix="○"
            if [[ $mode == "multi" && ${selected_indices[$i]} -eq 1 ]]; then
                prefix="●"
            fi
            if [[ $i -eq $current_selection ]]; then
                # Для выбранного элемента (меняем ▸ на ▶):
            echo -e "${PURPLE_DARK}║${PURPLE_DARK} ▶  $prefix ${items[$i]}${PURPLE_DARK}$(printf "%*s" $((35 - ${#items[$i]} - 4)))║${NC}"
            else
                # Для невыбранных (добавляем пробел):
            echo -e "${PURPLE_DARK}║${GRAY}    $prefix ${items[$i]}${PURPLE_DARK}$(printf "%*s" $((35 - ${#items[$i]} - 4)))║${NC}"
            fi
        done

        echo -e "${PURPLE_DARK}╚═════════════════════════════════════╝${NC}"
        
        if [[ $mode == "multi" ]]; then
            local selected_count=0
            for state in "${selected_indices[@]}"; do
                [[ $state -eq 1 ]] && ((selected_count++))
            done
            echo -e "${CYAN}┌─────────────────────────────────────────┐${NC}"
            echo -e "${CYAN}│ $(get_message "selected_apps"): ${selected_count}/${total} │${NC}"
            echo -e "${CYAN}└─────────────────────────────────────────┘${NC}"
        fi

        local key
        IFS= read -rsn1 key
        case "$key" in
            $'\x1b')
                read -rsn2 -t 0.1 seq
                case "$seq" in
                    "[A") current_selection=$(( (current_selection - 1 + total) % total )) ;;
                    "[B") current_selection=$(( (current_selection + 1) % total )) ;;
                esac
                ;;
            " ")
                if [[ $mode == "multi" ]]; then
                    if [[ ${selected_indices[$current_selection]} -eq 1 ]]; then
                        selected_indices[$current_selection]=0
                    else
                        selected_indices[$current_selection]=1
                    fi
                else
                    stty "$old_stty"
                    $callback "$current_selection"
                    return 0
                fi
                ;;
            "")
                if [[ $mode == "single" ]]; then
                    stty "$old_stty"
                    $callback "$current_selection"
                    return 0
                else
                    local -a chosen=()
                    for ((i=0; i<total; i++)); do
                        [[ ${selected_indices[$i]} -eq 1 ]] && chosen+=("$i")
                    done
                    stty "$old_stty"
                    $callback "${chosen[@]}"
                    return 0
                fi
                ;;
            "q"|"Q")
                stty "$old_stty"
                return 1
                ;;
        esac
    done
}


install_fish_config() {
    print_message "fish_config" "$PURPLE"
    
    echo -e "${PURPLE_DARK}╔═════════════════════════════════════╗${NC}"
    echo -e "${PURPLE_DARK}║$(printf "%*s" -33 "$(get_message 'fish_config_desc')")║${NC}"
    echo -e "${PURPLE_DARK}╚═════════════════════════════════════╝${NC}"
    
    # Создаём директорию для конфига Fish, если её нет
    local fish_config_dir="$HOME/.config/fish"
    if [ ! -d "$fish_config_dir" ]; then
        echo -e "${GRAY}┌─────────────────────────────────────────┐${NC}"
        echo -e "${GRAY}│ Создаю директорию для Fish...           │${NC}"
        echo -e "${GRAY}└─────────────────────────────────────────┘${NC}"
        mkdir -p "$fish_config_dir"
    fi
    
    # Скачиваем конфиг из GitHub
    local config_url="https://raw.githubusercontent.com/stquremwork/my-linux-rice/main/config.fish"
    local target_file="$fish_config_dir/config.fish"
    
    echo -e "${CYAN}┌─────────────────────────────────────────┐${NC}"
    echo -e "${CYAN}│ $(get_message "fish_downloading") │${NC}"
    echo -e "${CYAN}└─────────────────────────────────────────┘${NC}"
    
    # Скачиваем файл
    if curl -s -f -L "$config_url" -o "$target_file"; then
        echo -e "${WHITE}┌─────────────────────────────────────────┐${NC}"
        echo -e "${WHITE}│ ✓ $(get_message "fish_success")   │${NC}"
        echo -e "${WHITE}│   $(get_message "fish_info")      │${NC}"
        echo -e "${WHITE}└─────────────────────────────────────────┘${NC}"
        
        # Проверяем содержимое файла
        if [ -s "$target_file" ]; then
            echo -e "${LIGHT_GRAY}┌─────────────────────────────────────────┐${NC}"
            echo -e "${LIGHT_GRAY}│ Файл успешно скачан (размер: $(wc -l < "$target_file") строк) │${NC}"
            echo -e "${LIGHT_GRAY}└─────────────────────────────────────────┘${NC}"
            
            # Показываем первые несколько строк для проверки
            echo -e "${GRAY}┌─────────────────────────────────────────┐${NC}"
            echo -e "${GRAY}│ Первые 5 строк конфига:                 │${NC}"
            echo -e "${GRAY}└─────────────────────────────────────────┘${NC}"
            head -5 "$target_file" | while IFS= read -r line; do
                echo -e "${GRAY_DARK}  $line${NC}"
            done
        fi
        
        # Даём права на выполнение (если нужно)
        chmod 644 "$target_file" 2>/dev/null || true
        
        echo -e "${LIGHT_PURPLE}┌─────────────────────────────────────────┐${NC}"
        echo -e "${LIGHT_PURPLE}│ $(get_message "fish_restart")                 │${NC}"
        echo -e "${LIGHT_PURPLE}└─────────────────────────────────────────┘${NC}"
        
        # Дополнительные рекомендации
        echo -e "${CYAN}┌─────────────────────────────────────────┐${NC}"
        echo -e "${CYAN}│ Рекомендуемые следующие шаги:           │${NC}"
        echo -e "${CYAN}│ 1. Установить Fish Shell:               │${NC}"
        echo -e "${CYAN}│    sudo pacman -S fish                  │${NC}"
        echo -e "${CYAN}│ 2. Сделать Fish Shell по умолчанию:     │${NC}"
        echo -e "${CYAN}│    chsh -s $(which fish)               │${NC}"
        echo -e "${CYAN}│ 3. Перезапустить терминал               │${NC}"
        echo -e "${CYAN}└─────────────────────────────────────────┘${NC}"
    else
        echo -e "${DARK_GRAY}┌─────────────────────────────────────────┐${NC}"
        echo -e "${DARK_GRAY}│ ✗ $(get_message "fish_error")          │${NC}"
        echo -e "${DARK_GRAY}└─────────────────────────────────────────┘${NC}"
        
        # Пробуем альтернативный метод с wget
        echo -e "${GRAY}┌─────────────────────────────────────────┐${NC}"
        echo -e "${GRAY}│ Пробую альтернативный метод...          │${NC}"
        echo -e "${GRAY}└─────────────────────────────────────────┘${NC}"
        
        if command -v wget &> /dev/null; then
            if wget -q "$config_url" -O "$target_file"; then
                echo -e "${WHITE}┌─────────────────────────────────────────┐${NC}"
                echo -e "${WHITE}│ ✓ Успешно через wget!                   │${NC}"
                echo -e "${WHITE}└─────────────────────────────────────────┘${NC}"
            else
                echo -e "${DARK_GRAY}┌─────────────────────────────────────────┐${NC}"
                echo -e "${DARK_GRAY}│ ✗ Оба метода не сработали               │${NC}"
                echo -e "${DARK_GRAY}└─────────────────────────────────────────┘${NC}"
            fi
        fi
    fi
    
    echo ""
    read -p "$(echo -e "${DARK_GRAY}$(get_message 'press_enter')${NC}")" dummy
}


keyboard_layout_switch() {
    print_message "keyboard_layout" "$PURPLE"
    
    echo -e "${PURPLE_DARK}╔═════════════════════════════════════╗${NC}"
    echo -e "${PURPLE_DARK}║$(printf "%*s" -33 "$(get_message "keyboard_layout_desc")")║${NC}"
    echo -e "${PURPLE_DARK}╚═════════════════════════════════════╝${NC}"
    
    echo -e "${GRAY}┌─────────────────────────────────────────┐${NC}"
    echo -e "${GRAY}│ Настраиваю переключение раскладки...    │${NC}"
    echo -e "${GRAY}└─────────────────────────────────────────┘${NC}"
    
    # Устанавливаем Alt+Shift для переключения раскладки вперед
    gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Alt>Shift_L']"
    
    # Устанавливаем Shift+Alt для переключения раскладки назад
    gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Shift><Alt>Shift_L']"
    
    echo -e "${WHITE}┌─────────────────────────────────────────┐${NC}"
    echo -e "${WHITE}│ ✓ Настройки раскладки применены:        │${NC}"
    echo -e "${WHITE}│   • Переключение вперед: Alt + Shift    │${NC}"
    echo -e "${WHITE}│   • Переключение назад: Shift + Alt     │${NC}"
    echo -e "${WHITE}└─────────────────────────────────────────┘${NC}"
    
    # Проверяем текущие настройки
    echo -e "${LIGHT_GRAY}┌─────────────────────────────────────────┐${NC}"
    echo -e "${LIGHT_GRAY}│ Текущие настройки переключения:         │${NC}"
    echo -e "${LIGHT_GRAY}│ • Вперед: $(gsettings get org.gnome.desktop.wm.keybindings switch-input-source) │${NC}"
    echo -e "${LIGHT_GRAY}│ • Назад: $(gsettings get org.gnome.desktop.wm.keybindings switch-input-source-backward) │${NC}"
    echo -e "${LIGHT_GRAY}└─────────────────────────────────────────┘${NC}"
    
    # Дополнительные рекомендации
    echo -e "${CYAN}┌─────────────────────────────────────────┐${NC}"
    echo -e "${CYAN}│ Дополнительная информация:               │${NC}"
    echo -e "${CYAN}│ 1. Добавить раскладки:                   │${NC}"
    echo -e "${CYAN}│    gnome-control-center region &         │${NC}"
    echo -e "${CYAN}│ 2. Добавить русскую раскладку:           │${NC}"
    echo -e "${CYAN}│    gsettings set...                      │${NC}"
    echo -e "${CYAN}└─────────────────────────────────────────┘${NC}"
    
    echo -e "${LIGHT_PURPLE}┌─────────────────────────────────────────┐${NC}"
    echo -e "${LIGHT_PURPLE}│ $(get_message "keyboard_layout_success") │${NC}"
    echo -e "${LIGHT_PURPLE}│ $(get_message "keyboard_layout_info")    │${NC}"
    echo -e "${LIGHT_PURPLE}└─────────────────────────────────────────┘${NC}"
    
    echo ""
    read -p "$(echo -e "${DARK_GRAY}$(get_message 'press_enter')${NC}")" dummy
}


touchpad_right_click() {
    print_message "touchpad_right_click" "$PURPLE"
    
    echo -e "${PURPLE_DARK}╔═════════════════════════════════════╗${NC}"
    echo -e "${PURPLE_DARK}║$(printf "%*s" -33 "$(get_message "touchpad_right_click_desc")")║${NC}"
    echo -e "${PURPLE_DARK}╚═════════════════════════════════════╝${NC}"
    
    echo -e "${GRAY}┌─────────────────────────────────────────┐${NC}"
    echo -e "${GRAY}│ Настраиваю тачпад...                    │${NC}"
    echo -e "${GRAY}└─────────────────────────────────────────┘${NC}"
    
    # Включаем зоны тачпада для правого клика
    gsettings set org.gnome.desktop.peripherals.touchpad click-method 'areas'
    
    echo -e "${WHITE}┌─────────────────────────────────────────┐${NC}"
    echo -e "${WHITE}│ ✓ Настройки тачпада применены:          │${NC}"
    echo -e "${WHITE}│   • Режим клика: 'areas' (зоны)        │${NC}"
    echo -e "${WHITE}│   • Правый клик в правом нижнем углу   │${NC}"
    echo -e "${WHITE}└─────────────────────────────────────────┘${NC}"
    
    # Проверяем текущие настройки
    echo -e "${LIGHT_GRAY}┌─────────────────────────────────────────┐${NC}"
    echo -e "${LIGHT_GRAY}│ Текущие настройки тачпада:              │${NC}"
    echo -e "${LIGHT_GRAY}│ • Режим клика: $(gsettings get org.gnome.desktop.peripherals.touchpad click-method) │${NC}"
    echo -e "${LIGHT_GRAY}└─────────────────────────────────────────┘${NC}"
    
    # Дополнительные рекомендации
    echo -e "${CYAN}┌─────────────────────────────────────────┐${NC}"
    echo -e "${CYAN}│ Рекомендуемые настройки:                │${NC}"
    echo -e "${CYAN}│ • Тап для клика: true                   │${NC}"
    echo -e "${CYAN}│ • Естественная прокрутка: false         │${NC}"
    echo -e "${CYAN}└─────────────────────────────────────────┘${NC}"
    
    echo -e "${LIGHT_PURPLE}┌─────────────────────────────────────────┐${NC}"
    echo -e "${LIGHT_PURPLE}│ $(get_message "touchpad_enabled")         │${NC}"
    echo -e "${LIGHT_PURPLE}│ $(get_message "touchpad_info")            │${NC}"
    echo -e "${LIGHT_PURPLE}└─────────────────────────────────────────┘${NC}"
    
    echo ""
    read -p "$(echo -e "${DARK_GRAY}$(get_message 'press_enter')${NC}")" dummy
}


dock_pin() {
    print_message "dock_pin" "$PURPLE"
    
    echo -e "${PURPLE_DARK}╔═════════════════════════════════════╗${NC}"
    echo -e "${PURPLE_DARK}║$(printf "%*s" -33 "$(get_message "dock_pin_script")")║${NC}"
    echo -e "${PURPLE_DARK}╚═════════════════════════════════════╝${NC}"
    
    echo -e "${GRAY}┌─────────────────────────────────────────┐${NC}"
    echo -e "${GRAY}│ Ищу установленные приложения...         │${NC}"
    echo -e "${GRAY}└─────────────────────────────────────────┘${NC}"
    
    # Функция для поиска .desktop файла
    find_app() {
        local keywords="$1"
        
        local locations=(
            "/usr/share/applications"
            "$HOME/.local/share/applications"
            "/var/lib/flatpak/exports/share/applications"
            "$HOME/.local/share/flatpak/exports/share/applications"
        )
        
        for loc in "${locations[@]}"; do
            loc=$(eval echo "$loc")
            if [ -d "$loc" ]; then
                for keyword in $keywords; do
                    local found=$(find "$loc" -name "*.desktop" -type f 2>/dev/null | \
                                grep -i "$keyword" | head -1)
                    if [ -n "$found" ]; then
                        echo "$(basename "$found")"
                        return 0
                    fi
                done
                
                for keyword in $keywords; do
                    local found=$(find "$loc" -name "*.desktop" -type f 2>/dev/null | \
                                xargs grep -l -i "$keyword" 2>/dev/null | head -1)
                    if [ -n "$found" ]; then
                        echo "$(basename "$found")"
                        return 0
                    fi
                done
            fi
        done
        echo ""
    }
    
    # Функция проверки существования файла
    verify_desktop_file() {
        local desktop_file="$1"
        local locations=(
            "/usr/share/applications"
            "$HOME/.local/share/applications"
            "/var/lib/flatpak/exports/share/applications"
            "$HOME/.local/share/flatpak/exports/share/applications"
        )
        
        for loc in "${locations[@]}"; do
            if [ -f "$loc/$desktop_file" ]; then
                return 0
            fi
        done
        return 1
    }
    
    # Показать текущее содержимое Dock
    echo -e "${LIGHT_GRAY}┌─────────────────────────────────────────┐${NC}"
    echo -e "${LIGHT_GRAY}│ Текущий Dock:                           │${NC}"
    echo -e "${LIGHT_GRAY}│ $(gsettings get org.gnome.shell favorite-apps) │${NC}"
    echo -e "${LIGHT_GRAY}└─────────────────────────────────────────┘${NC}"
    
    # Очищаем Dock
    echo -e "${GRAY}┌─────────────────────────────────────────┐${NC}"
    echo -e "${GRAY}│ Очищаю Dock...                          │${NC}"
    echo -e "${GRAY}└─────────────────────────────────────────┘${NC}"
    gsettings set org.gnome.shell favorite-apps []
    
    APPS_LIST=()
    
    echo -e "${WHITE}┌─────────────────────────────────────────┐${NC}"
    echo -e "${WHITE}│ Поиск приложений:                       │${NC}"
    echo -e "${WHITE}└─────────────────────────────────────────┘${NC}"
    
    # Поиск приложений
    apps_to_find=(
        "zen|Zen Browser"
        "obsidian|Obsidian"
        "telegram|Telegram"
        "nautilus files|GNOME Files"
        "bitwarden|Bitwarden"
        "steam|Steam"
        "discord vencord|Discord"
        "yandex|Яндекс.Музыка"
        "terminal|Терминал"
    )
    
    for app_pair in "${apps_to_find[@]}"; do
        IFS='|' read -r keyword app_name <<< "$app_pair"
        echo -n -e "${GRAY}• $app_name: ${NC}"
        app=$(find_app "$keyword")
        if [ -n "$app" ] && verify_desktop_file "$app"; then
            APPS_LIST+=("$app")
            echo -e "${WHITE}✅ $app${NC}"
        else
            echo -e "${DARK_GRAY}✗${NC}"
        fi
    done
    
    # Финальный список
    if [ ${#APPS_LIST[@]} -gt 0 ]; then
        echo -e "${WHITE}┌─────────────────────────────────────────┐${NC}"
        echo -e "${WHITE}│ Финальный список (${#APPS_LIST[@]} приложений): │${NC}"
        echo -e "${WHITE}└─────────────────────────────────────────┘${NC}"
        
        for app in "${APPS_LIST[@]}"; do
            echo -e "${GRAY}  📌 $app${NC}"
        done
        
        # Закрепляем
        JSON_STRING="["
        for app in "${APPS_LIST[@]}"; do
            JSON_STRING+="'$app',"
        done
        JSON_STRING="${JSON_STRING%,}]"
        
        echo -e "${GRAY}┌─────────────────────────────────────────┐${NC}"
        echo -e "${GRAY}│ Закрепляю...                           │${NC}"
        echo -e "${GRAY}└─────────────────────────────────────────┘${NC}"
        
        if gsettings set org.gnome.shell favorite-apps "$JSON_STRING"; then
            echo -e "${LIGHT_PURPLE}┌─────────────────────────────────────────┐${NC}"
            echo -e "${LIGHT_PURPLE}│ $(get_message "dock_pin_success")          │${NC}"
            echo -e "${LIGHT_PURPLE}└─────────────────────────────────────────┘${NC}"
            
            echo -e "${CYAN}┌─────────────────────────────────────────┐${NC}"
            echo -e "${CYAN}│ Для применения изменений:               │${NC}"
            echo -e "${CYAN}│ Alt+F2 → r → Enter                      │${NC}"
            echo -e "${CYAN}└─────────────────────────────────────────┘${NC}"
        else
            echo -e "${DARK_GRAY}┌─────────────────────────────────────────┐${NC}"
            echo -e "${DARK_GRAY}│ ❌ Ошибка gsettings                      │${NC}"
            echo -e "${DARK_GRAY}└─────────────────────────────────────────┘${NC}"
        fi
    else
        echo -e "${DARK_GRAY}┌─────────────────────────────────────────┐${NC}"
        echo -e "${DARK_GRAY}│ ❌ Ничего не найдено                     │${NC}"
        echo -e "${DARK_GRAY}└─────────────────────────────────────────┘${NC}"
    fi
    
    echo ""
    read -p "$(echo -e "${DARK_GRAY}$(get_message 'press_enter')${NC}")" dummy
}


install_hyprland() {
    print_message "hyprland_install" "$PURPLE"
    
    echo -e "${GRAY}┌─────────────────────────────────────────┐${NC}"
    echo -e "${GRAY}│ $(get_message "update_before")                │${NC}"
    echo -e "${GRAY}└─────────────────────────────────────────┘${NC}"
    sudo pacman -Syu --noconfirm
    
    print_message "installing_wayland" "$PURPLE"
    sudo pacman -S wayland wayland-protocols xorg-xwayland --noconfirm --needed
    
    print_message "installing_hyprland" "$PURPLE"
    sudo pacman -S hyprland kitty waybar rofi wofi mako grim slurp wl-clipboard swaybg swaylock-effects --noconfirm --needed
    
    sudo pacman -S brightnessctl playerctl pamixer network-manager-applet blueman --noconfirm --needed
    
    print_message "setup_display_manager" "$PURPLE"
    echo -e "${LIGHT_GRAY}┌─────────────────────────────────────────┐${NC}"
    echo -e "${LIGHT_GRAY}│ Выберите Display Manager:               │${NC}"
    echo -e "${LIGHT_GRAY}│ 1) SDDM (рекомендуется)                 │${NC}"
    echo -e "${LIGHT_GRAY}│ 2) LightDM                              │${NC}"
    echo -e "${LIGHT_GRAY}│ 3) Без Display Manager                  │${NC}"
    echo -e "${LIGHT_GRAY}└─────────────────────────────────────────┘${NC}"
    read -p "$(echo -e "${WHITE}Ваш выбор [1-3]: ${NC}")" dm_choice
    
    case $dm_choice in
        1)
            sudo pacman -S sddm sddm-kcm --noconfirm --needed
            sudo systemctl enable sddm.service
            ;;
        2)
            sudo pacman -S lightdm lightdm-gtk-greeter --noconfirm --needed
            sudo systemctl enable lightdm.service
            ;;
        3)
            echo -e "${GRAY}┌─────────────────────────────────────────┐${NC}"
            echo -e "${GRAY}│ Display Manager не установлен.          │${NC}"
            echo -e "${GRAY}│ Для запуска Hyprland используйте:       │${NC}"
            echo -e "${GRAY}│ Hyprland                                │${NC}"
            echo -e "${GRAY}└─────────────────────────────────────────┘${NC}"
            ;;
        *)
            sudo pacman -S sddm sddm-kcm --noconfirm --needed
            sudo systemctl enable sddm.service
            ;;
    esac
    
    sudo systemctl enable NetworkManager.service
    sudo systemctl enable bluetooth.service
    
    echo -e "${LIGHT_PURPLE}┌─────────────────────────────────────────┐${NC}"
    echo -e "${LIGHT_PURPLE}│ $(get_message "hyprland_installed")           │${NC}"
    echo -e "${LIGHT_PURPLE}└─────────────────────────────────────────┘${NC}"
    
    echo -e "${CYAN}┌─────────────────────────────────────────┐${NC}"
    echo -e "${CYAN}│ Рекомендуемые следующие шаги:           │${NC}"
    echo -e "${CYAN}│ 1. Перезагрузите систему                │${NC}"
    echo -e "${CYAN}│ 2. Установите дополнительные приложения │${NC}"
    echo -e "${CYAN}│ 3. Настройте конфигурацию Hyprland      │${NC}"
    echo -e "${CYAN}└─────────────────────────────────────────┘${NC}"
    
    echo -e "${GRAY}┌─────────────────────────────────────────┐${NC}"
    echo -e "${GRAY}│ $(get_message "reboot_required")           │${NC}"
    echo -e "${GRAY}└─────────────────────────────────────────┘${NC}"
    
    echo ""
    read -p "$(echo -e "${DARK_GRAY}$(get_message 'press_enter')${NC}")" dummy
}


clean_gnome_apps() {
    print_message "clean_gnome" "$PURPLE"
    
    local -a gnome_apps=(
        "$(get_message 'app_dconf_editor')|dconf-editor|yay"
        "$(get_message 'app_gnome_contacts')|gnome-contacts|pacman"
        "$(get_message 'app_gnome_maps')|gnome-maps|pacman"
        "$(get_message 'app_gnome_calls')|gnome-calls|pacman"
        "$(get_message 'app_gnome_music')|gnome-music|pacman"
        "$(get_message 'app_gnome_text_editor')|gnome-text-editor|pacman"
        "$(get_message 'app_ghex')|ghex|pacman"
        "$(get_message 'app_epiphany')|epiphany|pacman"
        "$(get_message 'app_gnome_tour')|gnome-tour|pacman"
        "$(get_message 'app_evince')|evince|pacman"
        "$(get_message 'app_sushi')|sushi|pacman"
        "$(get_message 'app_gnome_characters')|gnome-characters|pacman"
        "$(get_message 'app_mpv')|mpv|pacman"
        "$(get_message 'app_linux_wallpaper')|linux-wallpaperengine-git|yay"
    )
    
    local -a app_names=()
    for app in "${gnome_apps[@]}"; do
        IFS='|' read -r name _ _ <<< "$app"
        app_names+=("$name")
    done
    
    current_messages["multi_title"]="$(get_message 'clean_gnome_desc')"
    
    if ! interactive_menu "multi" app_names clean_gnome_callback; then
        return
    fi
}


clean_gnome_callback() {
    local -a selected_indices=("$@")
    if [[ ${#selected_indices[@]} -eq 0 ]]; then
        echo -e "${GRAY}┌─────────────────────────────────────────┐${NC}"
        echo -e "${GRAY}│ Не выбрано ни одной программы.           │${NC}"
        echo -e "${GRAY}└─────────────────────────────────────────┘${NC}"
        read -p "$(echo -e "${DARK_GRAY}$(get_message 'press_enter')${NC}")" dummy
        return 0
    fi
    
    clear
    echo -e "${PURPLE_DARK}╔═════════════════════════════════════╗${NC}"
    echo -e "${PURPLE_DARK}║$(printf "%*s" -33 "$(get_message "clean_gnome")")║${NC}"
    echo -e "${PURPLE_DARK}╚═════════════════════════════════════╝${NC}"
    
    echo -e "${DARK_GRAY}┌─────────────────────────────────────────┐${NC}"
    echo -e "${DARK_GRAY}│ $(get_message "clean_warning") │${NC}"
    echo -e "${DARK_GRAY}└─────────────────────────────────────────┘${NC}"
    
    echo -e "${GRAY}┌─────────────────────────────────────────┐${NC}"
    echo -e "${GRAY}│ $(get_message "selected_apps"):           │${NC}"
    echo -e "${GRAY}└─────────────────────────────────────────┘${NC}"
    
    for idx in "${selected_indices[@]}"; do
        IFS='|' read -r name _ _ <<< "${gnome_apps[$idx]}"
        echo -e "${LIGHT_GRAY}  ✗ ${name}${NC}"
    done
    
    echo -e "${CYAN}┌─────────────────────────────────────────┐${NC}"
    echo -e "${CYAN}│ $(get_message "total_apps"): ${#selected_indices[@]}/${#gnome_apps[@]} │${NC}"
    echo -e "${CYAN}└─────────────────────────────────────────┘${NC}"
    
    read -p "$(get_message 'clean_confirm'): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${GRAY}┌─────────────────────────────────────────┐${NC}"
        echo -e "${GRAY}│ Удаление отменено.                      │${NC}"
        echo -e "${GRAY}└─────────────────────────────────────────┘${NC}"
        read -p "$(echo -e "${DARK_GRAY}$(get_message 'press_enter')${NC}")" dummy
        return 0
    fi
    
    echo ""
    echo -e "${PURPLE_DARK}╔═════════════════════════════════════╗${NC}"
    echo -e "${PURPLE_DARK}║$(printf "%*s" -33 "$(get_message "removing_selected")")║${NC}"
    echo -e "${PURPLE_DARK}╚═════════════════════════════════════╝${NC}"
    
    for idx in "${selected_indices[@]}"; do
        IFS='|' read -r name packages installer <<< "${gnome_apps[$idx]}"
        echo ""
        echo -e "${LIGHT_GRAY}▸ $name${NC}"
        echo -e "${GRAY}──────────────────────────────────────────${NC}"
        
        case "$installer" in
            "pacman")
                IFS=' ' read -ra pkg_array <<< "$packages"
                remove_pacman_packages "${pkg_array[@]}"
                ;;
            "yay")
                IFS=' ' read -ra pkg_array <<< "$packages"
                remove_yay_packages "${pkg_array[@]}"
                ;;
        esac
    done
    
    echo ""
    echo -e "${PURPLE_DARK}╔═════════════════════════════════════╗${NC}"
    echo -e "${PURPLE_DARK}║$(printf "%*s" -33 "$(get_message "clean_complete")")║${NC}"
    echo -e "${PURPLE_DARK}╚═════════════════════════════════════╝${NC}"
    
    echo ""
    read -p "$(echo -e "${DARK_GRAY}$(get_message 'press_enter')${NC}")" dummy
}


remove_pacman_packages() {
    local packages=("$@")
    for package in "${packages[@]}"; do
        if pacman -Qi "$package" &> /dev/null; then
            echo -e "${CYAN}  $(get_message 'removing_via') pacman: $package...${NC}"
            
            case "$package" in
                "gnome-characters")
                    sudo pacman -Rdd "$package" --noconfirm 2>/dev/null || true
                    ;;
                *)
                    sudo pacman -Rns "$package" --noconfirm 2>/dev/null || true
                    ;;
            esac
            
            if [ $? -eq 0 ]; then
                echo -e "${WHITE}  ✓ $package $(get_message 'removed_success')${NC}"
            else
                echo -e "${DARK_GRAY}  ✗ $(get_message 'remove_error') $package${NC}"
            fi
        else
            echo -e "${LIGHT_GRAY}  $package $(get_message 'already_removed')${NC}"
        fi
    done
}


remove_yay_packages() {
    local packages=("$@")
    for package in "${packages[@]}"; do
        if pacman -Qi "$package" &> /dev/null; then
            echo -e "${CYAN}  $(get_message 'removing_via') yay: $package...${NC}"
            yay -Rns "$package" --noconfirm 2>/dev/null || true
            if [ $? -eq 0 ]; then
                echo -e "${WHITE}  ✓ $package $(get_message 'removed_success')${NC}"
            else
                echo -e "${DARK_GRAY}  ✗ $(get_message 'remove_error') $package${NC}"
            fi
        else
            echo -e "${LIGHT_GRAY}  $package $(get_message 'already_removed')${NC}"
        fi
    done
}


main_menu_callback() {
    local choice="$1"
    case $choice in
        0) install_gnome ;;
        1) install_selected_applications ;;
        2) install_hyprland ;;
        3) update_system ;;
        4) clean_gnome_apps ;;
        5) dock_pin ;;
        6) touchpad_right_click ;;
        7) keyboard_layout_switch ;;
        8) install_fish_config ;;
        9) print_message "exit_script" "$PURPLE"; exit 0 ;;
    esac
}


lang_callback() {
    local choice="$1"
    case $choice in
        0)
            LANGUAGE="ru"
            for key in "${!messages_ru[@]}"; do
                current_messages[$key]="${messages_ru[$key]}"
            done
            ;;
        1)
            LANGUAGE="en"
            for key in "${!messages_en[@]}"; do
                current_messages[$key]="${messages_en[$key]}"
            done
            ;;
    esac

    if [[ "$LANGUAGE" == "ru" ]]; then
        export LC_ALL=ru_RU.UTF-8 2>/dev/null || true
        export LANG=ru_RU.UTF-8 2>/dev/null || true
    else
        export LC_ALL=en_US.UTF-8 2>/dev/null || true
        export LANG=en_US.UTF-8 2>/dev/null || true
    fi
}


install_selected_callback() {
    local -a selected_indices=("$@")
    if [[ ${#selected_indices[@]} -eq 0 ]]; then
        echo -e "${DARK_GRAY}┌─────────────────────────────────────────┐${NC}"
        echo -e "${DARK_GRAY}│ $(get_message "no_apps_selected")              │${NC}"
        echo -e "${DARK_GRAY}└─────────────────────────────────────────┘${NC}"
        read -p "$(get_message 'continue_anyway'): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            return 1
        fi
        return 0
    fi

    clear
    echo -e "${PURPLE_DARK}╔═════════════════════════════════════╗${NC}"
    echo -e "${PURPLE_DARK}║$(printf "%*s" -33 "$(get_message "selected_apps")")║${NC}"
    echo -e "${PURPLE_DARK}╚═════════════════════════════════════╝${NC}"
    
    for idx in "${selected_indices[@]}"; do
        echo -e "${WHITE}  ✓ ${app_names[$idx]}${NC}"
    done
    
    echo -e "${CYAN}┌─────────────────────────────────────────┐${NC}"
    echo -e "${CYAN}│ $(get_message "total_apps"): ${#selected_indices[@]}/${#app_names[@]} │${NC}"
    echo -e "${CYAN}└─────────────────────────────────────────┘${NC}"
    
    read -p "$(echo -e "${DARK_GRAY}$(get_message 'press_enter')${NC}")" dummy

    local need_yay=false
    for idx in "${selected_indices[@]}"; do
        IFS='|' read -r _ packages installer <<< "${all_apps[$idx]}"
        if [[ "$installer" == "yay" ]]; then
            need_yay=true
            break
        fi
    done
    $need_yay && install_yay

    echo ""
    echo -e "${PURPLE_DARK}╔═════════════════════════════════════╗${NC}"
    echo -e "${PURPLE_DARK}║$(printf "%*s" -33 "$(get_message "installing_selected")")║${NC}"
    echo -e "${PURPLE_DARK}╚═════════════════════════════════════╝${NC}"
    
    for idx in "${selected_indices[@]}"; do
        IFS='|' read -r name packages installer <<< "${all_apps[$idx]}"
        echo ""
        echo -e "${LIGHT_GRAY}▸ $name${NC}"
        echo -e "${GRAY}──────────────────────────────────────────${NC}"
        
        case "$installer" in
            "pacman")
                IFS=' ' read -ra pkg_array <<< "$packages"
                install_pacman_packages "${pkg_array[@]}"
                ;;
            "yay")
                IFS=' ' read -ra pkg_array <<< "$packages"
                install_yay_packages "${pkg_array[@]}"
                ;;
            "mixed")
                install_pacman_packages "cava" "cmatrix"
                install_yay_packages "tty-clock"
                ;;
        esac

        case "$name" in
            "$(get_message 'steam')")
                echo -e "${CYAN}  $(get_message "enable_multilib")${NC}"
                if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
                    echo -e "${DARK_GRAY}  $(get_message "multilib_warning")${NC}"
                    echo -e "${LIGHT_GRAY}  $(get_message "multilib_required")${NC}"
                fi
                ;;
            "$(get_message 'yandex_music')")
                echo -e "${CYAN}  $(get_message "nodejs_deps")${NC}"
                install_pacman_packages "nodejs-lts"
                ;;
            "$(get_message 'zerotier')")
                sudo systemctl enable --now zerotier-one
                echo -e "${WHITE}  ✓ $(get_message "zerotier_enabled")${NC}"
                ;;
            "$(get_message 'jetbrains')")
                echo -e "${DARK_GRAY}  $(get_message "activation_warning")${NC}"
                echo -e "${LIGHT_GRAY}  $(get_message "consider_license")${NC}"
                ;;
        esac
    done
    
    echo ""
    echo -e "${PURPLE_DARK}╔═════════════════════════════════════╗${NC}"
    echo -e "${PURPLE_DARK}║$(printf "%*s" -33 "$(get_message "app_done")")║${NC}"
    echo -e "${PURPLE_DARK}╚═════════════════════════════════════╝${NC}"
    
    echo ""
    read -p "$(echo -e "${DARK_GRAY}$(get_message 'press_enter')${NC}")" dummy
}


choose_language() {
    clear
    echo -e "${PURPLE_DARK}╔═════════════════════════════════════╗${NC}"
    echo -e "${PURPLE_DARK}║$(printf "%*s" -33 "$(get_message 'welcome')")║${NC}"
    echo -e "${PURPLE_DARK}╚═════════════════════════════════════╝${NC}"
    echo ""

    for key in "${!messages_ru[@]}"; do
        current_messages[$key]="${messages_ru[$key]}"
    done

    local -a lang_items=(
        "$(get_message 'lang_ru')"
        "$(get_message 'lang_en')"
    )

    current_messages["single_title"]="$(get_message 'choose_lang')"
    if ! interactive_menu "single" lang_items lang_callback; then
        return 1
    fi
}


install_yay() {
    print_message "check_yay" "$PURPLE"
    
    echo -e "${GRAY}┌─────────────────────────────────────────┐${NC}"
    if ! command -v yay &> /dev/null; then
        echo -e "${GRAY}│ $(get_message "yay_not_found") │${NC}"
        echo -e "${GRAY}└─────────────────────────────────────────┘${NC}"
        
        echo -e "${CYAN}  $(get_message "install_deps")${NC}"
        sudo pacman -S --needed base-devel git --noconfirm
        
        echo -e "${CYAN}  $(get_message "clone_yay")${NC}"
        cd /tmp || exit 1
        git clone https://aur.archlinux.org/yay.git
        cd yay || exit 1
        
        echo -e "${CYAN}  $(get_message "build_yay")${NC}"
        makepkg -si --noconfirm
        cd ..
        rm -rf yay
        
        echo -e "${WHITE}┌─────────────────────────────────────────┐${NC}"
        echo -e "${WHITE}│ $(get_message "yay_installed")               │${NC}"
        echo -e "${WHITE}└─────────────────────────────────────────┘${NC}"
    else
        echo -e "${GRAY}│ $(get_message "yay_exists")               │${NC}"
        echo -e "${GRAY}└─────────────────────────────────────────┘${NC}"
    fi
}


install_pacman_packages() {
    local packages=("$@")
    for package in "${packages[@]}"; do
        if ! pacman -Qi "$package" &> /dev/null; then
            echo -e "${CYAN}  $(get_message 'installing_via') pacman: $package...${NC}"
            sudo pacman -S "$package" --noconfirm --needed
            if [ $? -eq 0 ]; then
                echo -e "${WHITE}  ✓ $package $(get_message 'installed_success')${NC}"
            else
                echo -e "${DARK_GRAY}  ✗ $(get_message 'install_error') $package${NC}"
            fi
        else
            echo -e "${LIGHT_GRAY}  $package $(get_message 'already_installed')${NC}"
        fi
    done
}


install_yay_packages() {
    local packages=("$@")
    for package in "${packages[@]}"; do
        if ! pacman -Qi "$package" &> /dev/null; then
            echo -e "${CYAN}  $(get_message 'installing_via') yay (AUR): $package...${NC}"
            yay -S "$package" --noconfirm --needed
            if [ $? -eq 0 ]; then
                echo -e "${WHITE}  ✓ $package $(get_message 'installed_success')${NC}"
            else
                echo -e "${DARK_GRAY}  ✗ $(get_message 'install_error') $package${NC}"
            fi
        else
            echo -e "${LIGHT_GRAY}  $package $(get_message 'already_installed')${NC}"
        fi
    done
}


install_selected_applications() {
    local -a all_apps=(
        "$(get_message 'bitwarden')|bitwarden|pacman"
        "$(get_message 'chrome')|google-chrome|yay"
        "$(get_message 'zen_browser')|zen-browser-bin|yay"
        "$(get_message 'telegram_desktop')|telegram-desktop|yay"
        "$(get_message 'discord')|discord|yay"
        "$(get_message 'vencord')|vencord|yay"
        "$(get_message 'speedtest')|speedtest-cli|pacman"
        "$(get_message 'onlyoffice')|onlyoffice-bin|yay"
        "$(get_message 'qbittorrent')|qbittorrent|pacman"
        "$(get_message 'obs')|obs-studio|pacman"
        "$(get_message 'zerotier')|zerotier-one|pacman"
        "$(get_message 'widgets')|cava cmatrix tty-clock|mixed"
        "$(get_message 'jetbrains')|jetbrains-toolbox|yay"
        "$(get_message 'vscode')|visual-studio-code-bin|yay"
        "$(get_message 'obsidian')|obsidian|yay"
        "$(get_message 'neovim')|neovim|pacman"
        "$(get_message 'tabby')|tabby-terminal|yay"
        "$(get_message 'postgresql')|postgresql|pacman"
        "$(get_message 'mysql_server')|mysql|pacman"
        "$(get_message 'pgadmin')|pgadmin4|yay"
        "$(get_message 'wallpaper')|linux-wallpaperengine-git|yay"
        "$(get_message 'yandex_music')|yandex-music|yay"
        "$(get_message 'soundcloud')|soundcloud-dl|yay"
        "$(get_message 'krita')|krita|pacman"
        "$(get_message 'steam')|steam|pacman"
        "$(get_message 'portproton')|portproton|yay"
        "$(get_message 'elyprism')|elyprism-launcher-bin|yay"
        "$(get_message 'filezilla')|filezilla|pacman"
        "$(get_message 'rustdesk')|rustdesk-bin|yay"
        "$(get_message 'ventoy')|ventoy-bin|yay"
        "$(get_message 'gparted')|gparted|pacman"
        "$(get_message 'openrazer')|openrazer-meta polychromatic|yay"
        "$(get_message 'winscribe')|winscribe|yay"
    )

    app_names=()
    for app in "${all_apps[@]}"; do
        IFS='|' read -r name _ _ <<< "$app"
        app_names+=("$name")
    done

    current_messages["multi_title"]="$(get_message 'app_selection')"

    if ! interactive_menu "multi" app_names install_selected_callback; then
        return
    fi
}


install_gnome() {
    print_message "gnome_install" "$PURPLE"
    
    echo -e "${GRAY}┌─────────────────────────────────────────┐${NC}"
    echo -e "${GRAY}│ $(get_message "update_before")                │${NC}"
    echo -e "${GRAY}└─────────────────────────────────────────┘${NC}"
    sudo pacman -Syu --noconfirm
    
    echo -e "${CYAN}  $(get_message "installing_xorg")${NC}"
    sudo pacman -S xorg --noconfirm --needed
    
    echo -e "${CYAN}  $(get_message "installing_gnome")${NC}"
    sudo pacman -S gnome gnome-extra --noconfirm --needed
    
    echo -e "${CYAN}  $(get_message "setup_gdm")${NC}"
    sudo pacman -S gdm --noconfirm --needed
    sudo systemctl enable gdm.service
    sudo systemctl enable NetworkManager.service
    
    echo -e "${LIGHT_PURPLE}┌─────────────────────────────────────────┐${NC}"
    echo -e "${LIGHT_PURPLE}│ $(get_message "gnome_installed")             │${NC}"
    echo -e "${LIGHT_PURPLE}└─────────────────────────────────────────┘${NC}"
    
    echo -e "${GRAY}┌─────────────────────────────────────────┐${NC}"
    echo -e "${GRAY}│ $(get_message "reboot_required")           │${NC}"
    echo -e "${GRAY}└─────────────────────────────────────────┘${NC}"
    
    echo ""
    read -p "$(echo -e "${DARK_GRAY}$(get_message 'press_enter')${NC}")" dummy
}


update_system() {
    print_message "update_system" "$PURPLE"
    
    echo -e "${GRAY}┌─────────────────────────────────────────┐${NC}"
    echo -e "${GRAY}│ Обновляю систему...                     │${NC}"
    echo -e "${GRAY}└─────────────────────────────────────────┘${NC}"
    
    sudo pacman -Syu --noconfirm
    
    echo -e "${LIGHT_PURPLE}┌─────────────────────────────────────────┐${NC}"
    echo -e "${LIGHT_PURPLE}│ $(get_message "system_updated")               │${NC}"
    echo -e "${LIGHT_PURPLE}└─────────────────────────────────────────┘${NC}"
    
    echo ""
    read -p "$(echo -e "${DARK_GRAY}$(get_message 'press_enter')${NC}")" dummy
}


show_menu() {
    local -a menu_items=(
        "$(get_message 'menu_gnome')"
        "$(get_message 'menu_apps')"
        "$(get_message 'menu_hyprland')"
        "$(get_message 'menu_update')"
        "$(get_message 'menu_clean_gnome')"
        "$(get_message 'menu_dock_pin')"
        "$(get_message 'menu_touchpad_right_click')"
        "$(get_message 'menu_keyboard_layout')"
        "$(get_message 'menu_fish_config')"
        "$(get_message 'menu_exit')"
    )
    current_messages["single_title"]="$(get_message 'main_menu')"

    if ! interactive_menu "single" menu_items main_menu_callback; then
        return 1
    fi

    return 0
}


main() {
    choose_language || exit 0

    clear
    echo -e "${PURPLE_DARK}╔═════════════════════════════════════╗${NC}"
    echo -e "${PURPLE_DARK}║$(printf "%*s" -33 "$(get_message 'title')")║${NC}"
    echo -e "${PURPLE_DARK}╚═════════════════════════════════════╝${NC}"
    echo ""

    if [ "$EUID" -eq 0 ]; then
        echo -e "${DARK_GRAY}┌─────────────────────────────────────────┐${NC}"
        echo -e "${DARK_GRAY}│ $(get_message "root_warning") │${NC}"
        echo -e "${DARK_GRAY}└─────────────────────────────────────────┘${NC}"
        echo -e "${LIGHT_GRAY}┌─────────────────────────────────────────┐${NC}"
        echo -e "${LIGHT_GRAY}│ $(get_message "run_as_user") │${NC}"
        echo -e "${LIGHT_GRAY}└─────────────────────────────────────────┘${NC}"
        exit 1
    fi

    while true; do
        if ! show_menu; then
            choose_language || exit 0
            clear
            echo -e "${PURPLE_DARK}╔═════════════════════════════════════╗${NC}"
            echo -e "${PURPLE_DARK}║$(printf "%*s" -33 "$(get_message 'title')")║${NC}"
            echo -e "${PURPLE_DARK}╚═════════════════════════════════════╝${NC}"
            echo ""
            continue
        fi
    done
}

main "$@"