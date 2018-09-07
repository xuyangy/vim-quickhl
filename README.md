![](https://github.com/t9md/t9md/raw/dc52eaf0f8cb0984697f42c50be09174117b2ddb/img/quickhl_anime.gif)

[help](https://github.com/t9md/vim-quickhl/blob/master/doc/quickhl.txt)

# Highlight on the fly.

quickhl.vim support highlight for

- manual keywords
- `tag` in ctags generated file
- automatically higlight word under cursor(`<cword>`).

# Config

Minimum
```Vim
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
```

Full
```Vim
nmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>j <Plug>(quickhl-manual-this-whole-word)
nmap <Space>k <Plug>(quickhl-manual-this-whole-bigword)
nmap <Space>l <Plug>(quickhl-manual-this-bigword)
nmap <Space>a <Plug>(quickhl-manual-this-classish-bigword)
nmap <Space>b <Plug>(quickhl-manual-this-whole-classish-bigword)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)
```

.vimrc color recommends
```
let g:quickhl_manual_colors = [
        \ "gui=bold ctermfg=7   ctermbg=56  guibg=#a0b0c0 guifg=black",
        \ "gui=bold ctermfg=7   ctermbg=21  guibg=#d4a00d guifg=#ffffff",
        \ "gui=bold ctermfg=7   ctermbg=22  guibg=#06287e guifg=#ffffff",
        \ "gui=bold ctermfg=7   ctermbg=2   guibg=#4070a0 guifg=#ffffff",
        \ "gui=bold ctermfg=7   ctermbg=1   guibg=#a07040 guifg=#ffffff",
        \ "gui=bold ctermfg=7   ctermbg=4   guibg=#70a040 guifg=#ffffff",
        \ "gui=bold ctermfg=16  ctermbg=153 guifg=#ffffff guibg=#0a7383",
        \ "gui=bold ctermfg=7   ctermbg=3   guibg=#40a070 guifg=#ffffff",
        \ "gui=bold ctermfg=7   ctermbg=6   guibg=#007020 guifg=#ffffff",
        \ "gui=bold ctermfg=7   ctermbg=50  guibg=#1060a0 guifg=#ffffff",
        \ "gui=bold ctermfg=7   ctermbg=45  guibg=#5b3674 guifg=#ffffff",
        \ "gui=bold ctermfg=7   ctermbg=5   guibg=#0070e0 guifg=#ffffff",
        \ "gui=bold ctermfg=7   ctermbg=16  guibg=#4c8f2f guifg=#ffffff",
        \ ]
```
