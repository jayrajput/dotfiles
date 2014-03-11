function volume()
{
    if [ $1 == "+" ]; then amixer set Master 10%+; fi
    if [ $1 == "-" ]; then amixer set Master 10%-; fi
}

function dropboxd()
{
    $HOME/.dropbox-dist/dropboxd start &
}
