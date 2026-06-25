local color = require("config.colors")

-- タイトルでの設定
hl.window_rule({ match = { title = "^(KCalc)$" }, float = true, })
hl.window_rule({ match = { title = "^(Save File)$" }, float = true, })
hl.window_rule({ match = { title = "^(Open File)$" }, float = true, })
hl.window_rule({ match = { title = "^(Vivaldi 設定.*)$" }, float = true, })
-- クラスでの設定
hl.window_rule({ match = { class = "^(polkit-gnome-authentication-agent-1|hyprpolkitagent|org.org.kde.polkit-kde-authentication-agent-1)(.*)$" }, float = true, })
hl.window_rule({ match = { class = "^(photoflare)$" }, float = true, })
hl.window_rule({ match = { class = "^(zenity)$" }, float = true, })
hl.window_rule({ match = { class = "^(org.cachyos.hello)$" }, float = true, })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, float = true, })
-- タイトルとクラスの設定
hl.window_rule({
    match = { 
        class = "^(thunar)$",
        title = "(.*変更)$",
    },
    float = true,
})
-- サイズ含めた設定
hl.window_rule({
    match = { 
        class = "^(org.mozilla.Thunderbird)$",
        title = "^(作成.*)$",
    },
    float = true,
    size = { 1000, 800 }
})
hl.window_rule({
    match = { class = "^(org.gnome.TextEditor)$" },
    float = true,
    size = { 1200, 1080 },
})
hl.window_rule({
    match = { class = "^(exo-desktop-item-edit)$" },
    float = true,
    size = { 1200, 1080 },
})
hl.window_rule({
    match = { class = "^(MuPDF|org.kde.okular)$" },
    float = true,
    size = { 1200, 1400 },
})
hl.window_rule({
    match = { 
        class = "^(Alacritty)$",
        title = "^(btop)$",
    },
    float = true,
    size = { 1600, 1080 },
})
hl.window_rule({
    match = { 
        class = "^(Alacritty)$",
        title = "^(yazi)$",
    },
    float = true,
    size = { 1440, 1080 },
})
-- General window rules
hl.window_rule({
    match = { title = "^(Picture-in-Picture)$" },
    float = true,
    size = { 960, 540 },
    move = { "25%", "25%" },
})
hl.window_rule({ match = { title = ".*(保存|開く|設定)$" }, float = true, })

-- floating windowsの共通した設定
hl.window_rule({
    match = {
        float = true,
    },
    border_size = 1,
    border_color = color.cachylblue,
    rounding = 4,
})
-- 透明度の設定
hl.window_rule({ match = { class = "^(thunar)$" }, opacity = 0.8, })
hl.window_rule({ match = { class = "^(webcord)$" }, opacity = 0.8, })
hl.window_rule({ match = { class = "^(Alacritty)$" }, opacity = 0.75, animation = "slide", })

-- アプリごとの設定
require("config.apprules.browser")
require("config.apprules.game")
require("config.apprules.jetbrains")
require("config.apprules.poe1")
require("config.apprules.poe2")
require("config.apprules.remmina")
require("config.apprules.steam")
require("config.apprules.virt-manager")

-- workspace
local w_DP3 = { 1, }
local w_DP4 = { 2, 4, 5, }
local w_HDMIA5 = { 3, }
for _, ws in ipairs(w_DP3) do
    hl.workspace_rule({
        workspace = tostring(ws),
        monitor = "DP-3",
    })
end
for _, ws in ipairs(w_DP4) do
    hl.workspace_rule({
        workspace = tostring(ws),
        monitor = "DP-4",
    })
end
for _, ws in ipairs(w_HDMIA5) do
    hl.workspace_rule({
        workspace = tostring(ws),
        monitor = "HDMI-A-5",
    })
end
hl.workspace_rule({ workspace = "2", layout = "scrolling" })

-- layer
hl.layer_rule({
    match        = { namespace = "notifications" },
    animation    = "slide",
    blur         = true,
    ignore_alpha = 0.2,
})
hl.layer_rule({
    match      = { namespace = "wofi" },
    animation  = "slide",
    dim_around = true,
    -- blur    = true,
})
hl.layer_rule({
    match        = { namespace = "waybar" },
    animation    = "slide",
    blur         = true,
    xray         = false,
    ignore_alpha = 0.2,
})
hl.layer_rule({
    match     = { namespace = "hyprlock" },
    animation = "slide",
})