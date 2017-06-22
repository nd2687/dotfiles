augroup filetypedetect
  au BufRead,BufNewFile *.rb setfiletype ruby
  au BufRead,BufNewFile *.php setfiletype php
  au BufRead,BufNewFile *.swift setfiletype swift
  " /syntax にhtmljinjaのsyntaxhighlightのダウンロード
  au BufRead,BufNewFile *.twig setfiletype htmljinja
augroup END
