hl.window_rule({ match = { title = "(Path of Exile)"}, tag = "+poe1" })
hl.window_rule({ match = { class = "(steam_app_238960)"}, tag = "+poe1" })

hl.window_rule({ 
    match = { tag = "poe1" }, 
    workspace = "4",
    pseudo = true,
    center = true,
})

hl.window_rule({ 
    match = { class = "^(path of building.exe)$" }, 
    float = true,
})
