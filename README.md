> @Date    : 2020-11-20 22:35:11
>
> @Author  : Lewis Tian (taseikyo@gmail.com)
>
> @Link    : github.com/taseikyo

<a href="#readme"><img src="https://socialify.git.ci/taseikyo/dotfiles/image?description=1&forks=1&issues=1&language=1&owner=1&pattern=Floating%20Cogs&pulls=1&stargazers=1&theme=Light" alt="taseikyo dotfiles" title="taseikyo dotfiles"></a>

@taseikyo does Simple and Stupid dotfiles!

## Table of Contents

- [crontab](#crontab)
- [myrc](#myrc)
- [git](#git)
- [python](#python)
- [sublime](#sublime)
- [terminal](#terminal)
- [typora](#typora)
- [vim](#vim)
- [vs code](#vs-code)
- [wsl](#wsl)

## crontab

定义任务是一个很好用的功能，只需要写好对应的 Shell 脚本就可以免去手动执行的麻烦。我将一部分的定时任务导出了，放在 "linux/crontab" 文件中。

## myrc

将自定义的 alias 和环境变量提取出来放在 "linux/.myrc" 中，这样只需要加一行 `. ~/.myrc` 在 zsh/bash/xsh 的配置文件中即可共享使用，不需要在每个 xsh 中都配置一遍，方便快捷。

使用前记得下载 remove_duplicate_cmds.py 脚本到 home 目录：

```Bash
cd ~
wget https://raw.githubusercontent.com/taseikyo/backup-utils/master/Python/00E_remove_duplicate_history_cmds.py -O remove_duplicate_cmds.py
chmod +x remove_duplicate_cmds.py
```

## git

由于常用的 git 就那么几个 add/commit/push 命令（大雾），基本的 alias 就 co/br 够用了，配置文件在 "git/.gitconfig"，另外还有其他的 gs/gl 在 "linux/.myrc" 配置文件中。

## python

主要是配置 pip，由于某些原因，使用 pip 安装第三方库很慢，需要我们配置国内镜像，如 Ubuntu 一样，我还是习惯清华源，你也可以使用阿里源或者豆瓣源等等，在于个人喜好，配置文件在 Windows 下位于 "C:/Users/taseikyo/pip/pip.ini"，Linux 下位于 "/home/taseikyo/.pip/pip.conf"，内容一样，位置不同，我将其放在 "python/pip.ini"。

第二个是常用的三方库，都是我个人常用的（通过 `pip list > requirements.txt` 导出的），后面直接保存到本地然后 pip 安装即可。

## sublime

用了好多年的 sublime，现在已经完全习惯了，即使现在 vs code 有很多特性它没有，但是我还是离不开 sublime。特别是 SublimeTmpl 这个插件，"ctrl+alt+p" 新建 py 文件，"ctrl+shift+c" 新建 c++ 文件，"ctrl+shift+r" 新建 md 文件，而且配置好文件头，这个功能就很棒，相关配置文件放在 sublime 文件夹下。

添加了用户自定义的设置，比如换行设置成 unix 格式，再也不会出现用 sublime 修改 shell 脚本后在 wsl 中执行报错的问题 -> "Packages/User/Preferences.sublime-settings"

## terminal

terminal 的相关配置文件在另一个 [taseikyo/oh-my-terminal](https://github.com/taseikyo/oh-my-terminal) repo，此 repo 包含 terminal+wsl2 的相关配置，就不迁移过来了，有需要直接切过去看就是。

![](images/terminal.png)

## typora

今天（2021/03/29）才发现 typora 可以自定义快捷键，比我自己写的 sublime 扩展更方便、更精细（主要是不熟悉它那个类），比如可以区分代码和代码块，公式和内联公式。于是将熟悉的快捷键迁移过去了（Ctrl+1 - Ctrl+7），并加了对应的细化区分，具体配置看 "typora/conf.user.json"

更新，我在 [sublime-markdown-helper](https://github.com/taseikyo/sublime-markdown-helper) 中加了类似的更精细的快捷键，所以还是不会用 typora 而是继续 sublime 2333

## vim

由于 [vs code](https://code.visualstudio.com/) 可以直接连服务器了（具体配置见下面 vs code），所以 vim 的需求并不是太高，我常用的是 b 站出的一个配置：[bilibili/vim-vide](https://github.com/bilibili/vim-vide)

## vs code

vs code 主要配置在于 "Remote - SSH" 这个插件，它可以直接服务器，无论是直连节点，还是需要中间节点跳转的节点，在自己电脑上它的配置文件为 "C:/Users/taseikyo/.ssh/config"，我将其提取出来，现在是 "vscode/config"。

另外一个重要的配置文件是 settings.json，编辑它的快捷键是 `ctrl+shift+p` 输入 "open setting" 然后点 "Open Settings (JSON)"，就会弹出编辑的窗口，因为用 vscode 也不多，所以就一些简单的配置，见 "vscode/settings.json"，有些路径需要手动调整。

## wsl

在 [taseikyo/oh-my-terminal](https://github.com/taseikyo/oh-my-terminal) 中我总结了安装 wsl2 和使用 oh-my-zsh 的步骤。

有个问题是 Windows 文件的权限问题（一搜一大把），在 wsl 中，它们全部被挂在 /mount 目录下，权限都是 777（rwxrwxrwx），即使你使用 chmod 也没用，比如：

```Bash
tian % cd /mnt/f/GitHub/oh-my-terminal
oh-my-terminal [master] % ls
LICENSE  README.md  images  settings.json
oh-my-terminal [master] % ll
total 28K
drwxrwxrwx 1 tian tian 4.0K Dec 18 09:33 .
drwxrwxrwx 1 tian tian 4.0K Dec 18 09:33 ..
-rwxrwxrwx 1 tian tian  252 Dec 18 09:33 .bashrc
drwxrwxrwx 1 tian tian 4.0K Dec 18 09:45 .git
-rwxrwxrwx 1 tian tian  937 Dec 18 09:33 .myrc
-rwxrwxrwx 1 tian tian   98 Dec 18 09:33 .zshrc
-rwxrwxrwx 1 tian tian 1.1K Dec 18 09:33 LICENSE
-rwxrwxrwx 1 tian tian  10K Dec 18 09:33 README.md
drwxrwxrwx 1 tian tian 4.0K Dec 18 09:33 images
-rwxrwxrwx 1 tian tian 7.0K Dec 18 09:33 settings.json
```

解决方法是新建配置文件（/etc/wsl.conf），写入下面的配置（来自 https://superuser.com/a/1295442 的回答），修改完，重启就正常了。

另外我已经将其放在 "wsl/wsl.conf"，直接下载使用即可。

> /etc/wsl.conf

```
[automount]
enabled=true
options=metadata,uid=1000,gid=1000,umask=022
```

另外就是使用 gs（git status，见上面 .myrc 配置文件） 显示所有文件修改的问题，就是 Windows 和 Linux 换行方式区别导致的：Windows 中使用的文本换行方式是 CRLF，Linux 中使用的文本换行方式是 LF，然后 wsl 是 Linux 环境，默认使用 LF 换行方式，所以 git 会自动将代码当中与 wsl 系统不同的换行方式转化成 wsl 换行方式，从而状态发生变动。

```Bash
oh-my-terminal [master] % gs
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   .bashrc
        modified:   .myrc
        modified:   .zshrc
        modified:   LICENSE
        modified:   README.md
        modified:   settings.json

no changes added to commit (use "git add" and/or "git commit -a")
```

所以我们禁止 wsl 自动转换文本换行模式即可（在 Windows 中同样敲下面命令，否则 Windows 中也会出现一堆文件显示修改）：

```Bash
oh-my-terminal [master] % git config --global core.autocrlf true
oh-my-terminal [master] % gs
On branch master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean
```

## license

Copyright (c) 2020 Lewis Tian. Licensed under the MIT license.
