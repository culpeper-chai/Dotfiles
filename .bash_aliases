function discon {
        nohup "$@" &>/dev/null & disown %%
}

function popimg {
        discon feh "$@" --fullscreen --zoom max --force-aliasing
}

function sole {
         if [[ $(pgrep $1) ]]; then
            echo "$1 is already running."   
         else
            echo "Running $1..."
            exec "${@:1}" 
         fi
}

alias lsa="ls -A"
alias em="emacs -nw"
alias emm="discon emacs"
alias w3m="w3m https://www.google.com/"
