#!/usr/bin/python

import os;

gitRepo = os.path.dirname(os.path.realpath(__file__))
home    = os.path.expanduser("~")
links = {
    gitRepo + "/bashrc"                : home + "/.bashrc"                , 
    gitRepo + "/vimrc"                 : home + "/.vimrc"                 , 
    gitRepo + "/emacs"                 : home + "/.emacs"                 , 
    gitRepo + "/screenrc"              : home + "/.screenrc"              , 
    gitRepo + "/tmux.conf"             : home + "/.tmux.conf"             , 
    gitRepo + "/gitconfig"             : home + "/.gitconfig"             , 
    gitRepo + "/ubuntu.sh"             : home + "/.bash/ubuntu.sh"        , 
    gitRepo + "/bash-alias.sh"         : home + "/.bash/bash-alias.sh"    , 
    gitRepo + "/gnucash-config.user"   : home + "/.gnucash/config.user"   , 
    gitRepo + "/gnucash-my-report.scm" : home + "/.gnucash/my-report.scm" , 
}

# create directories if needed
for mydir in ["/.bash", "/.gnucash"]:
    if not os.path.exists(home + mydir):
        os.mkdir(home + mydir)

for target in links.keys():
    link = links[target]
    try:
        # Target path not existing is a bug, but I have made mistake in past
        # where I delete the target but forgot to update the entry here.
        if not os.path.exists(target):
            print "ERROR: Target does not exist %s" % (target)
            continue;

        if os.path.islink(link):
            print "WARN: Link already exist %s" % (link)
            continue;

        # we already checked for symlink, so this is a real file, back it up
        if os.path.exists(link):
            os.rename(link, link + ".bkp")
            print "INFO: Backed up %s -> %s" % (link, link + ".bkp")

        os.symlink(target, link)
        print "INFO: Linked %s -> %s" % (link, target)
    except OSError:
        print "ERROR: Failure running command link:%s, target:%s" % (link, target)
