#!/usr/bin/env zsh
# Installation script for ajzsh

source ./utils/terminal.ajzsh
source ./utils/banner.ajzsh

clear
ajzsh_banner

printf "This is the installation process for $fg_bold[magenta]aj$fg_bold[green]zsh${reset_color}:\n\n"
printf " $fg_bold[magenta]*${reset_color} Files will be installed at ~/.ajzsh\n"
printf " $fg_bold[magenta]*${reset_color} Will backup and replace ~/.zshrc\n"
echo ''

# Confirm user want to continue
if ! ajzsh_confirmWithUser "$fg[yellow]Did you want to continue with the installation"; then
	>&2 echo "$fg[red]Installation was aborted.${reset_color}"
	exit 1
fi

# Determine paths
pushd ./ &> /dev/null
SOURCE_DIR=`pwd`
INSTALL_DIR=~/.ajzsh
ZSHRC_PATH=~/.zshrc
popd &> /dev/null

# Check if a copy of ajzsh already exists
if [[ -d ${INSTALL_DIR} ]]; then
	echo "$fg[yellow]It seems a copy of ajzsh already exists at ${INSTALL_DIR}.${reset_color}"
	if ! ajzsh_confirmWithUser "$fg[red]Did you want to override the existing install"; then
		>&2 echo "$fg[red]Installation was aborted.${reset_color}"
		exit 1
	fi	
fi

# Copy files to installation directory
echo "Installing files at ${INSTALL_DIR}"
mkdir -p "${INSTALL_DIR}"
cp -pR "${SOURCE_DIR}"/* "${INSTALL_DIR}/"

# Check if .zshrc need to be backed up
if [[ -f "${ZSHRC_PATH}" ]]; then
	if ajzsh_confirmWithUser "$fg[yellow]Did you want to backup the existing ${ZSHRC_PATH}"; then
		cp "${ZSHRC_PATH}" "${ZSHRC_PATH}.bak"
		if [[ $? -eq 0 ]]; then
			echo "Made a backup to ${ZSHRC_PATH}.bak"
		else
			>&2 echo "$fg[red]Failed to make a backup, installation was aborted.${reset_color}"
			exit 1
		fi
	fi
fi

# Copy the .zshrc file
cp "${SOURCE_DIR}/templates/zshrc.ajzsh" "${ZSHRC_PATH}"
if ! [[ $? -eq 0 ]]; then
	>&2 echo "$fg[red]Failed to install ${ZSHRC_PATH}!${reset_color}"
	exit 1
fi

echo ''
echo "$fg_bold[green]Voila! Installation was a success.${reset_color}"
echo "$fg_bold[magenta]Please relaunch your terminal to confirm.${reset_color}"
