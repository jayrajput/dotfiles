function ppl() {
    echo "\n" | powershell -command "& '~/bin/ppl.ps1' $*"
}

function xls2csv() {
    # Get absolute path compatible to windows.
    local file=$(cygpath -w $(readlink -m QueryResult-June.xls))
    echo "\n" | powershell -command "& '~/bin/xls2csv.ps1' $file"
}

function winopen() {
    # Get absolute path compatible to windows.
    local file=$(cygpath -w "$(readlink -m "$*")")
    echo "\n" | powershell -command "& '$file'"
}

function winexplore() {
    echo "\n" | powershell -command "& ii ."
}

function dateToday() {
    date +%Y-%m-%d
}
addToPathFront "/usr/bin"
export PATH=/usr/bin:$PATH
