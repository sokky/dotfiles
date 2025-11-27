#!/bin/bash

# 設定されたプロセス（Class指定）をKillactiveするシェル
# 例外のプロセスを引数として実行する

COMMA_SEPARATED_CLASSES=$1
EXCEPTION_CLASSES=(${COMMA_SEPARATED_CLASSES//,/ })

ACTIVE_CLASS=$(hyprctl activewindow -j | jq -r '.class')

# 例外かどうかを判定するフラグ
IS_EXCEPTION=false

# 配列が空でないかチェック
if [ ${#EXCEPTION_CLASSES[@]} -gt 0 ]; then
    for exc_class in "${EXCEPTION_CLASSES[@]}"; do
        # 前後の空白をトリム（念のため）
        trimmed_class=$(echo "$exc_class" | xargs)
        if [ "$ACTIVE_CLASS" = "$trimmed_class" ]; then
            IS_EXCEPTION=true
            break
        fi
    done
fi

if [ "$IS_EXCEPTION" = false ]; then
    # 例外でなければウィンドウを閉じる
    hyprctl dispatch killactive
else
    # 例外の場合は何もしない（通知は任意）
    notify-send "Killing of window (Class: $ACTIVE_CLASS) is blocked."
fi
