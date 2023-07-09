#!/bin/bash

REQUIRED_PROGRAMS="rsync git vim nvim zsh curl"
NVIM="$HOME/.config/nvim"
NVIM_DIR="$NVIM/lua/" 
NVIM_USER_DIR="$NVIM/lua/user/" 
ASTROVIM="https://github.com/AstroNvim/AstroNvim "

RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
NC='\033[0m'

message(){
	case "$2" in
		info) echo -e "${CYAN}-> ${1}${NC}" 
		;;
		warning) echo -e "${YELLOW}-> ${1}${NC}"
		;;
		error) echo -e "${RED}-> ${1}${NC}" 
		;;
		success) echo -e "${GREEN}-> ${1}${NC}" 
		;;
		*) echo -e "${1}" 
		;;
	esac
}

print_head() {
	message "========== $1 =========="
}

check_requirements() {
	for program in $REQUIRED_PROGRAMS; do
		check_program "$program"
	done		
}

check_program() {
	if ! command -v "$1" &> /dev/null; then
		message "$1 not found, please install!" error 
		exit
	fi

	message "$1 found!" info
}

install_nvim_config() {
	if [ ! -d "$NVIM_DIR" ]; then
		message "Nvim directory not found, create?(y/n)" warning

		read -r OPTION
		
		if [ "$OPTION" == "y" ]; then
			mkdir -p "$NVIM_DIR" 
		else
			message "exiting!" error
			exit
		fi
	fi

	create_nvim_config
}

create_nvim_config() {
	print_head "Copying nvim user config"
	# FIXME: valid user dir exists
	if [ ! -L "$NVIM_USER_DIR" ] && [ ! -d "$NVIM_USER_DIR" ]; then
		cp -R ./nvim/lua/user "$HOME/.config/nvim/lua/"
		message "Finished copying!" success 
		return 1
	fi

	message "directory $NVIM_USER_DIR already exist!" info
}

clean_nvim() {
	local SHARE="$HOME/.local/share/"
	local STATE="$HOME/.local/state/"
	local CACHE="$HOME/.cache/nvim/"
	
	print_head "Cleaning nvim!" 
	
	rm -Rf "$NVIM"
	message "$NVIM done!" warning
	
	rm -Rf "$SHARE"
	message "$SHARE done!" warning

	rm -Rf "$STATE"
	message "$STATE done!" warning

	rm -Rf "$CACHE"
	message "$CACHE done!" warning
}

install_astrovim() {
	if [ -L "$NVIM_DIR" ] && [ -d "$NVIM_DIR" ]; then
		message "directory $NVIM_DIR already exist! Would like to clean? (y/n)" info
		
		read -r ANSWER
		
		if [ "$ANSWER" == "y" ]; then
			clean_nvim
		fi
	fi

	git clone --depth 1 "$ASTROVIM" "$NVIM/." 
}

install_ohmyzsh(){
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	install_powerLevel10k
	
	sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k/powerlevel10k"' "$HOME"/.zshrc
	sed -i 's/plugins=(git)/plugins=(git npm docker rust zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)' "$HOME"/.zshrc
}

install_powerLevel10k(){
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k	
}

check_requirements
install_nvim_config
