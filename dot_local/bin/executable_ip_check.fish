#!/usr/bin/env fish

# 1. 外部サービスから現在のグローバルIPを取得（例としてipifyを使用）
set current_ip (curl -s https://api.ipify.org)

# IPの取得に失敗した場合の簡易チェック
if test -z "$current_ip"
    echo "エラー: IPアドレスの取得に失敗しました。"
    exit 1
end

# 2. Homeディレクトリのパスとip_histのパスを変数に格納
set hist_file "$HOME/ip_hist"

# 3, 4, 5. ip_histの存在確認と比較・保存処理
if test -f "$hist_file"
    # 既にファイルが存在する場合、中身を読み込む
    set saved_ip (cat "$hist_file" | string trim)

    if test "$current_ip" = "$saved_ip"
        # 同じだった場合
        echo "Global IP: $current_ip 変更なし"
    else
        # 異なる場合
        echo "Global IP: $current_ip 変更されました"
        # 新しいIPで上書き保存
        echo "$current_ip" > "$hist_file"
    end
else
    # ファイルが存在しない初回実行時などは、ファイルを作成して保存
    echo "$current_ip" > "$hist_file"
    echo "Global IP: $current_ip 記録しました"
end
