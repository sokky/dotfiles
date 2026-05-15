-- 実行プログラムの定義
local def = {
    -- General
    filemanager = "thunar",
    launcher = "wofi",
    terminal = "alacritty",

    -- Startup
    firefox = "firefox",
    chromium = "chromium --ozone-platform-hint=auto",
    vivaldi =  "vivaldi-stable --ozone-platform-hint=auto",
    steam = "steam",
    thunderbird = "thunderbird",

    -- Screenshots
    shot_region = "grimblast --notify copy area",
    shot_window = "grimblast --notify copy active",
    shot_screen = "grimblast --notify copy output",
    shot_select_region = [[grim -g "$(slurp)" - | wl-copy & notify-send "Selected Region Screenshot to clipboard."]],
    shot_select_region_to_file = [[grim -g "$(slurp)" -t png & notify-send "Saved Selected Region Screenshot as a PNG File."]],

    -- ショートカットでKillしないプロセス（Class指定）
    -- POEはALTとQをよく押すがうっかりWin+Qを押しても大丈夫なように
    kill_exception = "steam_app_238960,steam_app_2694490",
}

return def
