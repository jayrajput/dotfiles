# If not running interactively, don't do anything more
case "$-" in
*i*) echo "" ;;
*)   return ;;
esac

function addToPath () 
{
   add_me=$1
   # in bash v3, we could say this -> if [[ ! ":$PATH:" =~ ":$d:" ]] ; then
   if [ $(echo ":$PATH:" | grep -c ":$add_me:") -eq 0 ] ; then
      PATH="$PATH:$add_me"
   fi
}

function addToPythonpath()
{
   add_me=$1
   if [ $(echo ":$PYTHONPATH:" | grep -c ":$add_me:") -eq 0 ] ; then
      export PYTHONPATH=$PYTHONPATH:$add_me
   fi
}

function mygitstatus()
{
    for i in $(ls); do cd $i; git status; cd -; done
}

function mydate()
{
    date +%Y%m%d
    # vim `date +%Y%m%d`
}

# Putty Window Title Functions
# In all of these, ^[ is really the "escape" character. You put it into
# a file using vi, by typing control-V and then hitting the Escape key.
# Likewise, ^G is the control-G character.  Again, hit control-V then
# hit control-G Change Putty window Title
wt ()
{
    echo -n "]2;${@}"  
}
it ()
{
    echo -n "]0;${@}"
}
defwt ()
{
    echo -n "]2;$(whoami) @ $(hostname)"
}
cls ()
{
    # works only for vt100's and the like
    echo "[;H[2J"
}

function convertFileSize()
{
    # See http://askubuntu.com/questions/1164/how-to-easily-resize-images
    convert  -resize 50% source.png dest.jpg
    convert  -resize 1024X768  source.png dest.jpg
}

# show the last dir in the pwd inside square brackets followed by dollar sign.
# \W = last dir in the pwd.
export PS1="[\W]\$"

# set fignore=(\~) # files ending in ~ will be ignored by completion
# Automatically correct spelling mistake in the cd command.
# see http://linux.101hacks.com/cd-command/shopt-s-cdspell/
shopt -s cdspell

# source any system specific script
bashDir=~/.bash
if [ -e $bashDir ]; then
    for file in $(ls $bashDir); do
        source $bashDir/$file
    done
fi

export pySearchSelect=~/bin/pySearchSelect.py

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
