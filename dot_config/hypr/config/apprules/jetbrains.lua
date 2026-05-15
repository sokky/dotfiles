-- たぶんJetbrainsのダイアログ系の設定
hl.window_rule({ 
    match = { class = "(.*jetbrains.*)$", title = "^$", float = true, }, 
    size = { "50%", "50%" },
})
hl.window_rule({ 
    match = { class = "(.*jetbrains.*)$", title = "^(win.*)$" }, 
    no_initial_focus = true,
    no_focus = true,
})
hl.window_rule({ 
    match = { class = "(.*jetbrains.*)$", title = "^\\s$" }, 
    no_initial_focus = true,
    no_focus = true,
})
