# 介绍

自用的vim配置和插件配置, 用于Windows/Linux

# 配置步骤

## VimPlug安装

下载plug.vim到vim的autoload里.

Windows下在安装目录下,Linux需要在根目录创建~/.vim/autoload这个文件夹,然后到该链接下载[plug.vim](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)

然后拷贝`_vimrc`到用户目录,Windows在`C:\Users\[用户名]\_vimrc`, Linux在`~/.vimrc`

## 插件安装
在vim的命令模式下执行`PlugInstall`

## coc.nvim配置

coc.nvim是一个代码自动补全的插件,要支持具体的语音自动补齐还要进行配置或者安装coc.nvim的插件

c/c++

命令模式下执行`CocInstall coc-clangd`, 需要计算机安装nodejs,然后执行`CocLocalConfig`可以在项目路径下进行配置, 仓库里面的coc配置复制过去即可,同时要安装clangd, 需要cmake编译时生成`compile_commands.json`, cmake命令参数要加上`-DCMAKE_EXPORT_COMPILE_COMMANDS=YES`或者在cmake里面set这个变量为YES

同样安装cmake支持, `CocInstall coc-cmake`

驼峰拼写问题

```
"驼峰
Plugin 'kamykn/spelunker.vim'
"多行编辑
Plugin 'mg979/vim-visual-multi'
"语法高亮插件
Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'
```

## ~~YouCompleteMe安装~~

安装插件, 插件目录安装, 附带clangd和libclang的动态库封装,在ycm_core.so里面

```shell
python3 install.py --clangd-completer --clang-completer
```

默认不用配置`.ycm_extra_conf.py`就能识别当前工作目录根目录下的`compile_commands.json`文件

## ccls语法服务器

[ccls](https://github.com/MaskRay/ccls/wiki)
