##
## Basic aliases
##
################################################################################

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
alias now='date +"%T'
alias timestamp='date +%Y%m%d_%H%M%S'
alias path='echo -e ${PATH//:/\\n}'


##
## Common apps
##
################################################################################
alias apt-get='sudo apt-get'
alias vi=vim


##
## sysadmin
##
################################################################################

# cpu info (older system use /proc/cpuinfo)
alias cpuinfo='lscpu || less /proc/cpuinfo'
alias meminfo='free -m -l -t'
## get GPU ram on desktop / laptop## 
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

# list top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
# list top process eating cpu
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# Network
function DiscoverMyIP() {
  local interface=(`ifconfig -s | grep -o eth[0-9]`)
  [ ${#interface[@]} -ne "1" ] && {
    echo "[$FUNCNAME] ERROR: Cannot discover IP address"
    return 1
  }
  local ip=`ifconfig $interface | grep -o "[0-9][0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" | grep -m 1 ".*"`
  echo $ip
}
export MY_IP=$(DiscoverMyIP)
alias my-ip=DiscoverMyIP
