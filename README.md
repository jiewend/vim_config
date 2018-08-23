# vim_config
简单快速的 vim 插件配置

最近频繁更换电脑，配置了好多次 vim 编辑器，久病成良医，简单总结一下如何快速配置一个好用的vim编辑器
- 下载 vim 源码，编译安装
> git clone git@github.com:vim/vim.git
    
> cd vim/
    
> sudo apt-get install python-dev、python3-dev、ruby-dev、liblua5.3-dev、libx11-dev、libgtk2.0-dev、libgtk-3-dev、libncurses-dev
    
    - 注意：下一步，中的 --with-python-config-dir= 需要改成自己电脑的python 路径，
    
> ./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-gui=gtk2 --enable-cscope --prefix=/usr
  
> make
    
> make install

- 安装插件管理工具vundle 

> git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

- 在家目录下新增 .vimrc 文件，.vimrc 在本仓库中有
- 使用 vundle 安装插件
    - 进入 vim ,输入:PluginInstall,即开始下载插件，YouCompleteMe 需要下载后手动安装
    - 注意，YouCompleteMe 插件有时候会下载特别慢，建议另外下载安装，将 .vimrc 中  Plugin 'Valloric/YouCompleteMe' 注释掉，另外下载 YouCompleteMe 

> git clone git@github.com:Valloric/YouCompleteMe.git ~/.vim/bundle/

- 安装 YouCompleteMe 智能补全

> cd  .vim/bundle/YouCompleteMe/

> python install.py

- 增加 CPP 模板补全
    - 在 ~/.vim/bundle/ultisnips/mysnippets 目录下新增cpp.snippets文件，文件见本仓库

- 至此，vim 应该已经有以下额外的常用功能，还有其他功能用的不多的功能就不一一列举了
    - 语法高亮
    - 快速注释，快速取消注释
    - 智能补全，模板补全

- 开始愉快地敲代码吧

注：本文是[参考博客](https://github.com/yangyangwithgnu/use_vim_as_ide#5.2) 的快速精简版本，足够本人日常使用，如需其他功能，请移步[原博客](https://github.com/yangyangwithgnu/use_vim_as_ide#5.2)
