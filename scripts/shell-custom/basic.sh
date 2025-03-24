# Conservative file operations
#alias rm='rm -i'
#alias mv='mv -i'
#alias cp='cp -i'

# List hidden files
alias l.='ls -d .* --color=auto'

# Change directory
alias cd..='cd ..'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias ..6='cd ../../../../../..'
alias ..7='cd ../../../../../../..'
alias ..8='cd ../../../../../../../..'
alias ..9='cd ../../../../../../../../..'


##
## Utils
##
################################################################################
alias now='date +"%T"'
alias timestamp='date +%Y%m%d_%H%M%S'
alias path='echo -e ${PATH//:/\\n}'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias alert-sound='while true; do sleep 1; echo -e -n "\a"; done'
alias soundalert=alert-sound
alias alert-done='echo "Done at: $(date)"; alert "Done at: $(date)"; alert-sound'


##
## Common apps
##
################################################################################
alias apt-get='sudo apt-get'
alias vi=vim

