-- 別ファイルにするまでもないゲーム用
hl.window_rule({ match = { title = "(ディアブロ IV)"}, tag = "+dia4" })

hl.window_rule({ 
    match = { tag = "dia4" }, 
    workspace = "4",
    pseudo = true,
    center = true,
    float = true,
    fullscreen = true,
})
