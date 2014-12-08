#!/bin/bash
############################
# makesymlinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Created by: https://github.com/michaeljsmalley
# URL: https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
# Modified by: https://github.com/thiagosalles
############################

########## Variables

dotfiles_dir=~/dotfiles                      # dotfiles directory
backup_dir=~/dotfiles/backup                 # old dotfiles backup directory
files="bash_profile bashrc vimrc gitconfig"  # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $backup_dir for backup of any existing dotfiles in ~ ..."
mkdir -p $backup_dir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dotfiles_dir directory ..."
cd $dotfiles_dir
echo "done"

# move any existing dotfiles in homedir to backup directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $backup_dir"
    mv ~/.$file $backup_dir
    echo "Creating symlink to $file in home directory."
    ln -s $dotfiles_dir/$file ~/.$file
done
