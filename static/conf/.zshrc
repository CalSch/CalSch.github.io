
test -e ~/.zsh-settings && source ~/.zsh-settings
test -e /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
test -e /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
test -e /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh && source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

if [[ -e /home/$USER/.config/omp.json ]]; then
	eval "$(oh-my-posh init zsh --config "/home/$USER/.config/omp.json")"
fi


PF_INFO="ascii title os host kernel uptime memory" pfetch

alias kssh="kitten ssh"
alias yay="yay --color=auto"
alias grep="grep --color=auto"
alias ip="ip -color"
alias objdump="objdump --disassembler-color=on --visualize-jumps=extended-color"



export EDITOR="vim"

export PATH=/home/$USER/.cargo/bin:$PATH



