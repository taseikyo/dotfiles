# ~/.zshrc: executed by zsh(1) for non-login shells.

# original .zshrc content start...
 
# original .zshrc content end...
ZSH_THEME="random"

plugins=(git zsh-autosuggestions)

[[ -f ~/.myrc ]] && source ~/.myrc

[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit

# 使得提示命令部分颜色为黄色，不至于区分不开
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=yellow"

# 默认 Ctrl+U 是删除整行（Bash 是删除光标前的命令）
bindkey \^U backward-kill-line
