source /usr/share/cachyos-fish-config/cachyos-config.fish

alias vi 'nvim'

# fish用の環境変数
# Zellijで変な文字列が出ることの対処
set -gx COLORTERM truecolor

#Fish起動時に実行されるコマンドをここに設定 
# ↑で定義されているWelcomeMessageの関数を上書き
function fish_greeting
	fastfetch
	ip_check.fish
end
