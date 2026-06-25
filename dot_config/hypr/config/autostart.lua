local def = require("config.defaults")

hl.on("hyprland.start", function()

    hl.exec_cmd("uwsm app -- waybar")
    hl.exec_cmd("uwsm app -- hypridle")
    hl.exec_cmd("uwsm app -- mako")
    hl.exec_cmd('bash -c "mkfifo /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob && tail -f /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob | wob & disown"')
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")

    -- Slow app launch fix
    hl.exec_cmd("systemctl --user import-environment")
    hl.exec_cmd("which dbus-update-activation-environment 2>/dev/null")
    hl.exec_cmd("dbus-update-activation-environment --systemd")

    -- 壁紙
    hl.exec_cmd("uwsm app -- awww-daemon")
    hl.exec_cmd("sleep 1; awww-randomize.sh ~/Pictures/wallpaper/4k DP-3")
    hl.exec_cmd("sleep 2; awww-randomize.sh ~/Pictures/wallpaper/1600 DP-4")
    hl.exec_cmd("sleep 3; awww-randomize.sh ~/Pictures/wallpaper/4k HDMI-A-5")

    -- Jetbrains toolbox
    hl.exec_cmd("uwsm app -- /home/afx/develop/jetbrains-toolbox/bin/jetbrains-toolbox  --vm-options=-Dawt.toolkit.name=WLToolkit --minimize")

    -- IME
    -- 設定をリロードする
    -- fcitx5をバックグラウンドで起動し、既に起動しているインスタンスがあれば置き換える
    hl.exec_cmd("uwsm app -- fcitx5-remote -r && uwsm app -- fcitx5 -d --replace")

    -- Input-Remapper
    -- 何故かAutoloadが効かないため手動で
    -- hl.exec_cmd("input-remapper-control --command stop-all && input-remapper-control --command autoload")

    -- コピペ管理
    hl.exec_cmd("uwsm app -- wl-paste --type text --watch cliphist store")
    hl.exec_cmd("uwsm app -- wl-paste --type image --watch cliphist store")

    -- Dark Theme
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")

    -- GUI Startup
    -- 同時に起動すると予期しないWorkspaceで起動するアプリがあるため適当にずらすこと
    -- ブラウザ
    hl.exec_cmd("sleep 1; uwsm app -- " .. def.firefox)
    hl.exec_cmd("sleep 2; uwsm app -- " .. def.chromium)
    hl.exec_cmd("sleep 3; uwsm app -- " .. def.vivaldi)
    -- Steam
    hl.exec_cmd("sleep 1; uwsm app -- " .. def.steam)
    -- workspace指定
    hl.dispatch(
        hl.dsp.exec_cmd("sleep 1; uwsm app -- " .. def.terminal, {
            workspace = "2 silent"
        })
    )
    hl.dispatch(
        hl.dsp.exec_cmd("sleep 1; uwsm app -- " .. def.thunderbird, {
            workspace = "3 silent"
        })
    )
    hl.dispatch(
        hl.dsp.exec_cmd("sleep 3; uwsm app -- " .. def.filemanager, {
            workspace = "3 silent"
        })
    )
    -- hl.dispatch(
    --     hl.dsp.exec_cmd("sleep 3; uwsm app -- webcord", {
    --         workspace = "3 silent"
    --     })
    -- )
    -- 暫定
    hl.dispatch(
        hl.dsp.exec_cmd("sleep 6; uwsm app -- electron42 /usr/lib/webcord ", {
            workspace = "3 silent"
        })
    )


end)
