# create symbolic links to the target used as keys in the associatve array

declare -A targetLink
# function does not do much but helps to indent the calls.
storeTargetLink () 
{
    targetLink[$1]="$2"
}

mygit=$HOME/git/mine
mygitConfig=$mygit/config
mygitPss=$mygit/pySearchSelect
# link for files in config
storeTargetLink "$mygitConfig/bashrc"    "$HOME/.bashrc"
storeTargetLink "$mygitConfig/vimrc"     "$HOME/.vimrc"
storeTargetLink "$mygitConfig/emacs"     "$HOME/.emacs"
storeTargetLink "$mygitConfig/screenrc"  "$HOME/.screenrc"
storeTargetLink "$mygitConfig/tmux.conf" "$HOME/.tmux.conf"
storeTargetLink "$mygitConfig/vpnc.conf" "$HOME/.vpnc.conf"
storeTargetLink "$mygitConfig/gitconfig" "$HOME/.gitconfig"
storeTargetLink "$mygitConfig/ubuntu.sh" "$HOME/.bash/ubuntu.sh"
storeTargetLink "$mygitConfig/bash-alias.sh" "$HOME/.bash/bash-alias.sh"
storeTargetLink "$mygitConfig/gnucash-config.user"  "$HOME/.gnucash/config.user"
storeTargetLink "$mygitConfig/gnucash-my-report.scm"  "$HOME/.gnucash/my-report.scm"
# link for files in pss
storeTargetLink "$mygitPss/examples/views.sh" "$HOME/.bash/views.sh"
storeTargetLink "$mygitPss/examples/marks"    "$HOME/bin/marks"
storeTargetLink "$mygitPss/pss.py"            "$HOME/bin/pss.py"


for target in ${!targetLink[*]}; do
    link=${targetLink[$target]}
# rm $link
    if [ ! -L $link ]; then
        ln -s $target $link
        echo "SUCCESS: $link created for $target"
    else
	ls -l $link
        if [ -L $link ]; then
            echo "ERROR: $link already exists"
        else
            echo "ERROR: $link is not a symbolic link"
        fi
    fi
done
