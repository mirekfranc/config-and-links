set -o vi


### variables
export EDITOR=vim

test "x$TERM" = "xxterm-256color" && txcolor=4 || txcolor=1
PS1="\[\e[1;3${txcolor}m\][\u@\h \W]?\[\e[0m\] "


### aliases
alias l=ls
alias ll='ls -l'
alias aa=tmux
alias gdb='gdb -q'
alias e=emacs


### functions
:k()
{
    ls -t | head -${1:-10}
}

____t()
{
    elinks "http://www.slovnik.cz/bin/mld.fpl?vcb=${1}&${2}" \
    -no-numbering -dump-width 200 -dump |\
    head -36 |\
    cut -c 4- |\
    column
}

:e()
{
    ____t "${1}" "trn=translate&dictdir=encz.en&lines=50"
}

:ec()
{
    ____t "${1}" "trn=translate&dictdir=encz.cz_a&lines=50"
}

:g()
{
    ____t "${1}" "dictdir=gecz.ge&lines=50"
}

:gc()
{
    ____t "${1}" "dictdir=gecz.cz&lines=50"
}

:f()
{
    ____t "${1}" "trn=přeložit&dictdir=frcz.fr&lines=50"
}

:fc()
{
    ____t "${1}" "trn=p%C5%99elo%C5%BEit&dictdir=frcz.cz&lines=50"
}
