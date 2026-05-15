-- Steam共通
hl.window_rule({ 
    match = { title = "^(Steam - Self Updater)$" }, 
    float = true,
})

hl.window_rule({ 
    match = { class = "^(steam)" }, 
    workspace = "4",
})
