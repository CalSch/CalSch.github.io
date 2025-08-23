# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration

if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#  source /usr/share/zsh/manjaro-zsh-prompt
fi

if [[ -e /home/$USER/.config/omp.json ]]; then
	eval "$(oh-my-posh init zsh --config "/home/$USER/.config/omp.json")"
fi

if [[ -e /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
	source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

#neofetch #--ascii_distro arch
PF_INFO="ascii title os host kernel uptime memory" pfetch

type kitten > /dev/null && alias ssh="kitten ssh"
alias yay="yay --color=auto"
alias grep="grep --color=auto"
alias ip="ip -color"

alias objdump="objdump --disassembler-color=on --visualize-jumps=extended-color"

alias batt="upower -i /org/freedesktop/UPower/devices/battery_BAT1"

export EDITOR="vim"

export PATH=/home/$USER/.cargo/bin:$PATH

#### z88dk config ####
export PATH=$PATH:/home/$USER/build-stuff/z88dk/bin
export ZCCCFG=${HOME}/build-stuff/z88dk/lib/config
#eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)

