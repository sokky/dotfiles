
hl.curve( "overshot", { type = "bezier", points = { {0.13, 0.88}, {0.29, 1.1} } } )
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4, style = "slide", bezier = "overshot" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, style = "popin 80%", bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "default", })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 6, style = "slide", bezier = "overshot", })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 6, style = "slidefade 80%", bezier = "overshot" })
