#!/bin/sh

for f in .??*
do
    if [ "$f" = ".vim" ]; then continue; fi

    ln -sfnv "$(pwd)/$f" "$HOME/$f"
done
