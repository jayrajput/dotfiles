function volume()
{
    if [ $1 == "+" ]; then amixer set Master 10%+; fi
    if [ $1 == "-" ]; then amixer set Master 10%-; fi
}

function dropboxd()
{
    $HOME/.dropbox-dist/dropboxd start &
}

function pathpretty()
{
    echo $PATH | tr ":" "\n"
}

function pinknoise()
{
    play -c 2 -n synth pinknoise band -n 2500 4000 tremolo 0.03 5 reverb 20 gain -l
}

alias ll='ls -l'
