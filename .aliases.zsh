#TODO: source at zsh.rc

### COLORIZE ###

# Colorize cat
alias cat=ccat
# Colorize less
alias less=cless

### APT ###

alias allinst="apt list --installed"
alias allpkgs="dpkg --get-selections | grep -v deinstall"

#####
# new ll
# no_comment
alias ll="ls -lah"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias history="history -E"

### Usage: encrypt_remote host.tld
alias encrypt_remote="ssh -o UserKnownHostsFile=/dev/null -o PubkeyAcceptedAlgorithms=+ssh-rsa -l root -p 2222"
