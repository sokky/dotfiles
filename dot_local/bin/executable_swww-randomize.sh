#!/bin/sh
# $1 画像フォルダ
# $2 モニタ名
# $3 切り替え秒数（ない場合は1時間）

DEFAULT_INTERVAL=3600 # In seconds

if [ $# -lt 2 ] || [ ! -d "$1" ]; then
	printf "arg error."
	exit 1
fi

# See swww-img(1)
RESIZE_TYPE="fit"
export SWWW_TRANSITION_FPS="${SWWW_TRANSITION_FPS:-60}"
export SWWW_TRANSITION_STEP="${SWWW_TRANSITION_STEP:-2}"

while true; do
	find "$1" -type f \
	| while read -r img; do
		echo "$(</dev/urandom tr -dc a-zA-Z0-9 | head -c 8):$img"
	done \
	| sort -n | cut -d':' -f2- \
	| while read -r img; do
		swww img --resize="$RESIZE_TYPE" "$img" --outputs "$2"
		sleep "${3:-$DEFAULT_INTERVAL}"
	done
done
