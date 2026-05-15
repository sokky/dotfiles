-- 何故か[workspace 2]指定しても正しい場所にて起動しなくなったのでこちらで制約をつける

hl.window_rule({ 
    match = { 
        class = "^(chromium)$",
    },
    workspace = 1,
})

hl.window_rule({ 
    match = { 
        class = "^(firefox)$",
    },
    workspace = 1,
})

hl.window_rule({ 
    match = { 
        class = "^(vivaldi-stable)$",
    },
    workspace = 2,
})