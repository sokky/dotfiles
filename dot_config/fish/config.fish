source /usr/share/cachyos-fish-config/cachyos-config.fish

alias vi 'nvim'

#Fish起動時に実行されるコマンドをここに設定 
# ↑で定義されているWelcomeMessageの関数を上書き
function fish_greeting
	fastfetch
	echo "TODOリスト"
	task list
end
