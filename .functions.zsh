# ToDo: source at  zsh.rc

### COLORIZE ###

# echo RED
echor() {
    echo -e "\e[31m$@\e[0m"
}

# echo BLUE
echob() { 
    echo -e "\e[34m$@\e[0m"
}

# echo GREEN
echog() { 
    echo -e "\e[32m$@\e[0m"
}

# echo YELLOW
echoy() { 
    echo -e "\e[33m$@\e[0m"
}

### NOTES ###

quicknote() { 
	[[ $# == 0 ]] && tail ~/.quicknote || echo "$(date +'%F %R'): $*" >>~/.quicknote 
}
alias quicknote=' noglob quicknote'


### SSH ###

sshdiff() {
    vimdiff <(ssh "$1" ${@:3}) <(ssh "$2" ${@:3})
}

### WEB ###

google() {
echo "Searching for: '$@'"
    for word in $@ ; do
        search="$search%20$word"
    done
xdg-open "https://www.google.com/search?q=$search"
unset search
}


### MATH ###

math() {
bc <<< "$@"
}


### XXX ###

pipe2vim() {
	() { vim $1 </dev/tty >/dev/tty && cat $1 } =(cat)
}

### OSENV ###
echo -e "#!/bin/bash\nexport PATH=$PATH" > /tmp/restore_path
osenv() {
    osenvfiles="/home/marc/.config/openstack/ENV"
    export OS_ENV=$(find $osenvfiles \! -executable -type f -printf "%f\n" | sed 's/ /\n/g'| sort | fzf)
    source $osenvfiles/$OS_ENV
}

### TRASH ###

# Idea:
## Move Files to trash with rm instad of delete
## Remove Files after 30 Days automaic with systemd-timer
## Ask for delete of big files directly
## get a force option
