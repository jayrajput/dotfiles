#!/bin/bash
###############################################################################
# makesymlink.sh
# See http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/ for more details.
# This script creates symlinks from the home directory to any desired dotfiles
# in ~/git/config
###############################################################################

dir=~/git/config                        # config directory
olddir=~/archive/oldConfig              # old config backup directory
files="bashrc vimrc tmux.conf screenrc" # list of files to symlink in homedir

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
