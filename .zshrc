# ~/.zshrc: executed by zsh(1) for non-login shells.

# original .zshrc content start...
 
# original .zshrc content end...
ZSH_THEME="random"

plugins=(git zsh-autosuggestions)

if [ -f ~/.myrc ]; then
	. ~/.myrc
fi
