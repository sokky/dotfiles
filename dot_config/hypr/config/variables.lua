local color = require("config.colors")

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 3,
        border_size = 1,
        layout = dwindle,

        col = {
            active_border = color.cachylgreen,
            inactive_border = color.cachymblue,
        },
        snap = {
            enabled = true,
        },
    },

    input = {
        numlock_by_default = true,
    },

    gestures = {
        workspace_swipe_distance = 250,
        workspace_swipe_min_speed_to_force = 15,
        workspace_swipe_create_new = false,
    },

    group = {
        col = {
            border_active = color.cachydgreen,
            border_inactive = color.cachylgreen,
            border_locked_active = color.cachymgreen,
            border_locked_inactive = color.cachydblue,
        },

        groupbar = {
            font_family = "Fira Sans",
            text_color = color.cachydblue,
            col = {
                active = color.cachydgreen,
                inactive = color.cachylgreen,
                locked_active = color.cachymgreen,
                locked_inactive = color.cachydblue,
            },
        },
    },

    misc = {
        font_family = "Fira Sans",
        splash_font_family = "Fira Sans",
        disable_hyprland_logo = true,
        col = {
            splash = color.cachylgreen,
        },
        background_color = color.cachydblue,
        enable_swallow = true,
        swallow_regex = "^(firefox|chromium|vivaldi-stable|thunar|btrfs-assistant)$",
        focus_on_activate = true,
        vrr = 2,
    },

    render = {
        direct_scanout = true,
    },

    dwindle = {
        special_scale_factor = 0.8,
        preserve_split = true,
    },

    master = {
        new_status = master,
        special_scale_factor = 0.8,
    },

    scrolling = {
        column_width = 0.5,
        direction = "right",
    },
})
