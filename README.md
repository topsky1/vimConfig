# vimConfig
Configuration of my vim.



#### 插件的安装

1. 将配置文件复制到家目录
2. 启动vim
3. 命令模式下(普通模式下输入:)    输入 `PlugInstall`  回车
4. 其中ycm插件需要再手动安装一下 参考下面的ycm插件的安装





#### ycm插件的安装:

- ```shell
  ~$ cd .vim/bundle/YouCompleteMe/
  ~$ python3 install.py --clang-completer
  ```

- 然后需要自己配置 `.ycm_extra_conf.py`    只要是路径, 如果不会就去https://github.com/Valloric/YouCompleteMe 下载个样例  或者搜一下怎么设置, 主要是设置编译参数和头文件路径

- 至于其他的设置参考我的配置文件





#### 禁用插件

> .vimrc中有Plug插件管理器, 然后注释掉里面插件的对行即可禁用对应插件