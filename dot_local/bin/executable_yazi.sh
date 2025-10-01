#!/bin/bash

# デスクトップエントリで直接実行できないためシェルで実行
if [ -d $(wl-paste) ]; then
  alacritty -t yazi -e yazi $(wl-paste)
else
  alacritty -t yazi -e yazi  
fi
