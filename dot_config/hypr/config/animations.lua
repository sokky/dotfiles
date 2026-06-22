hl.curve("md3", {
    type = "bezier",
    points = {
        {0.2, 0.0},
        {0.0, 1.0}
    }
})

hl.curve("menu", {
    type = "bezier",
    points = {
        {0.1, 1.0},
        {0.0, 1.0}
    }
})

hl.curve("rubber", {
    type = "spring",
    mass = 1,
    stiffness = 80,
    dampening = 12
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4,
    spring = "rubber",
    style = "popin 85%"
})

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 3,
    bezier = "menu",
    style = "slide"
})

hl.animation({
    leaf = "fadeLayers",
    enabled = true,
    speed = 4,
    bezier = "menu"
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 6,
    bezier = "menu",
    style = "slidefade 20%"
})