#!/bin/bash
############################
# makesymlinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Created by: https://github.com/michaeljsmalley
# URL: https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
# Modified by: https://github.com/thiagosalles
############################

########## Oh My Zsh + Powerlevel10k

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

########## Variables

dotfiles_dir=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )  # dotfiles directory
backup_dir=$dotfiles_dir/backup  # dotfiles backup directory
files="vimrc gitconfig zshrc zshrc.pre-oh-my-zsh p10k.zsh" # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $backup_dir for backup of any existing dotfiles in ~ ... "
mkdir -p $backup_dir
echo "done"

# move any existing dotfiles in homedir to backup directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
echo "Moving any existing dotfiles from ~ to $backup_dir ... "
for file in $files; do
    mv ~/.$file $backup_dir 2>/dev/null
    echo "Creating symlink to $file in home directory."
    ln -s $dotfiles_dir/$file ~/.$file
done
