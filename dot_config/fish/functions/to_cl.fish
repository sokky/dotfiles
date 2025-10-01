# 標準入力をコマンドラインに置く。引数としてコマンドが渡されたら「コマンド 標準入力」となる
function to_cl
    read -z INPUT
    if test (count "$argv") -gt 0
        set INPUT (echo "$argv[1]" "$INPUT")
    else
        set INPUT (echo "$INPUT")
    end
    set CL (echo "$INPUT" | awk '{printf "%s", $0}' | tr -d '\n\r')
    commandline "$CL"
end
