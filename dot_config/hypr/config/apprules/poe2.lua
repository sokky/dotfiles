hl.window_rule({ match = { title = "(Path of Exile 2)"}, tag = "+poe2" })
hl.window_rule({ match = { class = "(steam_app_2694490)"}, tag = "+poe2" })

hl.window_rule({ 
    match = { tag = "poe2" }, 
    workspace = "4",
    pseudo = true,
    center = true,
})
