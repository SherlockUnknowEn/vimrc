# vimrc

### requirement (auto-completed)

- node 16.20.0
- 编译安装 ccls (同时需要下载prebuild clang+llvm-xxx对应版本)
- ~~clangd-linux-16.0.2~~
- ~~universal-ctags~~

### install

1. 安装 [amix/vimrc](https://github.com/amix/vimrc)

2. 修改~/.vim_runtime/my_configs.vim

3. PlugInstall 安装插件

4. `:CocConfig`
在setting.json中加入

```
{
  "clangd.arguments": ["--header-insertion=never"],
  "inlayHint.display": false,
  "languageserver": {
    "ccls": {
      "command": "ccls",
      "filetypes": ["c", "cpp", "cc", "c++", "cuda", "objc", "objcpp"],
      "rootPatterns": [".ccls-root", ".ccls", ".git", ".hg", ".svn", ".root", "compile_commands.json"],
      "initializationOptions": {
        "cache": {
          "directory": ".ccls-cache"
        },
        "client": {
          "snippetSupport": true
        }
      }
    }
  }
}
```

6. 安装COC子插件
`CocInstall coc-clangd coc-json coc-highlight coc-python coc-pyright`

7. 安装 bear
`apt-get install bear`

8. 在项目目录
`bear make <target>` 即可生成clangd需要的 compile_commands.json 文件
