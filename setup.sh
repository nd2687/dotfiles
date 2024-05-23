#!/bin/bash

# カレントディレクトリを取得
CURRENT_DIR=$(pwd)

# シンボリックリンクを作成するファイルとディレクトリのリスト
files=(
    "_vim"
    "_bash_profile"
    "_bashrc"
    "_gitconfig"
    "_screenrc"
    "_tmux.conf"
    "_vimperatorrc"
    "_vimrc"
    "_zshrc"
)

# 各ファイル/ディレクトリに対してシンボリックリンクを作成
for file in "${files[@]}"; do
    # 対象ファイル/ディレクトリの絶対パス
    source_path="$CURRENT_DIR/$file"
    
    # ドットファイル名に変換
    target_file=".$(echo $file | sed 's/^_//')"
    target_path="$HOME/$target_file"

    # .gitとREADMEを除外
    if [[ "$file" != ".git" && "$file" != "README.mkd" ]]; then
        # 既存のシンボリックリンクやファイルがあれば削除
        if [ -e "$target_path" ]; then
            rm -rf "$target_path"
        fi
        
        # シンボリックリンクを作成
        ln -s "$source_path" "$target_path"
        echo "Created symlink: $target_path -> $source_path"
    fi
done

echo "All symlinks created successfully."
