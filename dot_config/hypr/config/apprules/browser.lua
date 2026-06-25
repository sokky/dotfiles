-- 何故か[workspace 2]指定しても正しい場所にて起動しなくなったのでこちらで制約をつける

hl.window_rule({ 
    match = { 
        class = "^(chromium)$",
    },
    workspace = 1,
})
-- 起動時横のサイズを指定する
-- PC起動時を考慮して若干遅らせる
hl.on("window.open", function(win)
    if win.class:match("^(chromium)$") then
        hl.timer(function()
            hl.dispatch(
                hl.dsp.window.resize({
                    x=1350, y=1, window=win
                })
            )
        end, {
            timeout = 400,
            type = "oneshot",
        })
    end
end)

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