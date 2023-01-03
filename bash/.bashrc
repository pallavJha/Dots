# This script will be just added in the default ~/.bashrc already present

# For add the name of the git branch after the PS1
# Bash looks like:
#   waterbottle@ubuntu-20-04-lts:~/code/wow-git-repo (add-branch-in-bash)
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ "$color_prompt" = yes ]; then
    # Add \[\033[01;91m\]\A\[\033[00m\] to show the time too
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;90m\]\u@\h\[\033[00m\]:\[\033[01;93m\]\w\[\033[00m\] \[\033[01;91m\]$(git_branch)\[\033[00m\]\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\n\$ '
fi


# Combine the history of all the open bash shell
export PROMPT_COMMAND='history -a'

# Alias for restarting the clipboard process after it stops working
alias clipboard-restart="pkill -f VBoxClient; VBoxClient --clipboard"
