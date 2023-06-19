# vimrc

### requirement (auto-completed)

- node 16.20.0
- clangd-linux-16.0.2

### install

1. 安装 [amix/vimrc](https://github.com/amix/vimrc)

2. 修改~/.vim_runtime/my_configs.vim

3. PlugInstall 安装插件

4. 修改~/.config/coc/memos.json，增加一行

`"clangd.arguments": ["--header-insertion=never"]`

5. 安装COC子插件
`CocInstall coc-clangd coc-json`
