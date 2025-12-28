
SITE=https://calschwick.net/conf

backup() {
	if [ -e "$1" ]; then
		#TODO: what if $1.bak exists?
		echo Backing up $1
		cp -va "$1" "$1".bak
	fi
}

i-yay() {
	sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
}

i-base-pkgs() {
	yay -S --needed --noconfirm less curl wget vim tmux git usbutils htop nfs-utils base-devel man-db cronie sysstat tree plocate zsh oh-my-posh pfetch zsh-syntax-highlighting zsh-history-substring-search
}
i-gui-pkgs() {
	power-profiles-daemon ksystemlog kitty partitionmanager firefox
}

i-zsh() {
	backup ~/.zshrc
	backup ~/.zsh-settings
	backup ~/.config/omp.json
	curl $SITE/.zshrc > ~/.zshrc
	curl $SITE/.zsh-settings > ~/.zsh-settings
	curl $SITE/omp.json > ~/.config/omp.json
}

i-kitty() {
	backup ~/.config/kitty

	curl $SITE/kitty.tgz > /tmp/kitty.tgz
	tar -xvf /tmp/kitty.tgz -C test
	rm -v /tmp/kitty.tgz
}

i-vim() {
	backup ~/.vimrc
	curl $SITE/.vimrc > ~/.vimrc
}

i-vim-plug() {
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo
	echo Next time you enter vim, do :PlugInstall
}

ask-user() {
	read -p "$1 [Yn]: " choice

	# giving choices there tasks using
	case $choice in
		[nN]* ) return 1 ;;
		*) return 0 ;;
	esac
}

main() {
	echo '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
	echo '!!        WARNING          !!'
	echo '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
	echo
	echo This is currently untested! Theorhetically it should backup things before overwriting but I havent tested it yet.
	echo
	echo Press enter to continue or Ctrl-C to stop
	read
	echo fr?
	read
	echo ok
	ask-user "Install yay? (needs sudo)" && i-yay
	ask-user "Install base pkgs? (needs sudo)" && i-base-pkgs
	ask-user "Install gui pkgs? (needs sudo)" && i-gui-pkgs
	ask-user "Install zsh config?" && i-zsh
	ask-user "Install kitty config?" && i-kitty
	ask-user "Install vim config?" && i-vim && \
		ask-user "Install vim-plug?" && i-vim-plug

}

main
