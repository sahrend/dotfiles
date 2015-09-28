#
# Sam Ahrend 
#  bashrc - 20150926
#

export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
export PAGER='less -X'				 # Don't clear screen on man exit
export EDITOR=/usr/bin/vim

# Append commands to the bash command history file (~/.bash_history)
# instead of overwriting it.
shopt -s histappend
 
# Append commands to the history every time a prompt is shown,
# instead of after closing the session.

alias apt='sudo apt'
alias gpgaes='gpg -c --cipher-algo aes'

export PATH=${PATH}:$HOME/.scripts


# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

setAliasForLastCommand () {
  if [ $# -eq 1 ]; then

    # get last command from the history
    lastCommand=$(history | tail -n 2 | head -n 1 | sed -e 's|^\s*[0-9]*\s*||' -e 's|\x27|\x27"\x27"\x27|g')
    if [[ $HISTTIMEFORMAT != "" ]]; then
      for i in `echo $HISTTIMEFORMAT`; do export lastCommand=`echo $lastCommand | sed 's/^\s*\S*\s*//'` ; done
    fi
    aliasName=$1

    # repeat until available alias found
    while true; do
      # check if alias exists
      type $aliasName >/dev/null 2>&1
      if [ $? -eq 0 ]; then
        echo "$aliasName already exists - enter another alias name."
        read aliasName
      else
        break
      fi
    done

    # set last command as alias and write to file
    echo "alias $aliasName='$lastCommand'" >> ~/.bash_aliases

    # load the new alias
    . ~/.bash_aliases

  else
    # display usage information
    echo "Usage: setAliasForLastCommand <aliasName>"
    echo "short: a <aliasName>"
    echo
    echo "Sets an alias for the last command."
  fi
}

alias ac='setAliasForLastCommand'


# load alias file if available
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

