#!/bin/bash

# Wofiから選択されたものをuwsm経由で起動する
# 選択されなかった場合はなにもしない
# Hyprlandから直接呼ぶと不要な通知が来るためシェルで定義
pidof wofi
if [ $? -eq 0 ]; then
    exit
fi

COM=$(wofi --show drun --define=drun-print_desktop_file=true --width 1200 --sort-order alphabetical)
if [ -z  "$COM" ]; then
    exit
fi
uwsm app -- "$COM"
