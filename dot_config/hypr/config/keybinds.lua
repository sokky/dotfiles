local def = require("config.defaults")
local mainMod = "SUPER"

-- よく使うもの
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("uwsm app -- " .. def.terminal))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kill-active-except.sh " .. def.kill_exception))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("uwsm stop"))
hl.bind(mainMod .. " + H", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("wofi-uwsm.sh"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Screenshot
hl.bind(mainMod .. " + p", hl.dsp.exec_cmd(def.shot_region))
hl.bind(mainMod .. " + CTRL + p", hl.dsp.exec_cmd(def.shot_window))
hl.bind(mainMod .. " + ALT + p", hl.dsp.exec_cmd(def.shot_screen))
hl.bind(mainMod .. " + SHIFT + p", hl.dsp.exec_cmd(def.shot_select_region))
hl.bind(mainMod .. " + SHIFT + s", hl.dsp.exec_cmd(def.shot_select_region_to_file))

-- Copy Paste
hl.bind(mainMod .. " + V", 
    hl.dsp.exec_cmd(table.concat({
        "pidof " .. def.launcher .. " ||",
        "cliphist list |", 
        def.launcher .. "--dmenu --width 1000 |",
        "cliphist decode |",
        "wl-copy",
    }, " ")
))

-- Color Picker(クリップボードにコピー)
hl.bind(mainMod .. " + SHIFT + c", hl.dsp.exec_cmd("hyprpicker -a"))

-- ======= Window Actions =======
-- Move window with mainMod + LMB/RMB and draggingsudo
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
-- Resize window with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
-- Move window towards a direction
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))
-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right",  hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
-- WindowsみたいなAltTab
hl.bind("ALT + Tab", 
    hl.dsp.exec_cmd(table.concat({
        "pidof " .. def.launcher .. " ||",
        "hyprctl clients |",
        "grep 'class:' |",
        "awk -F ': ' '{print $2}' |",
        def.launcher .. " --dmenu --width 600 |",
        [[xargs -i hyprctl dispatch "hl.dsp.focus({ window = 'class:{}' })"]],
    }, " ")
))

-- Resizing windows
hl.bind(mainMod .. " + CTRL + SHIFT + right", hl.dsp.window.resize({ x = 15, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + SHIFT + left", hl.dsp.window.resize({ x = -15, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -15, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 15, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + SHIFT + L", hl.dsp.window.resize({ x = 15, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + SHIFT + H", hl.dsp.window.resize({ x = -15, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + SHIFT + K", hl.dsp.window.resize({ x = 0, y = -15, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + SHIFT + J", hl.dsp.window.resize({ x = 0, y = 15, relative = true }), { repeating = true })

for i = 1, 10 do
    local key = i % 10
    -- Switch workspaces
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    -- Move active window to a workspace
    hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Scroll through existing workspaces with mainMod + , or .
hl.bind(mainMod .. " + PERIOD", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + COMMA", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- ======= Additional Settings =======
hl.config({
    binds = {
        allow_workspace_cycles = true,
        workspace_back_and_forth = true,
        workspace_center_on = 1,
        movefocus_cycles_fullscreen = true,
        window_direction_monitor_fallback = true
    },
})
