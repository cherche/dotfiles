source $HOME/.alias
source $HOME/.env

# Hop into tmux by default (https://unix.stackexchange.com/a/113768)
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux new-session -A -s main
fi
# explanation: verify tmux installed, verify interactive shell, ignore tmux (no nesting)

# Start z in every session to track frecent directories
. $(brew --prefix)/etc/profile.d/z.sh

# Make crontab read/write ~/.crontab instead of some mystery file
if test -z $CRONTABCMD; then
  # allows to source zshrc twice
  export CRONTABCMD=$(which crontab)
  crontab()
  {
    if [[ $@ == "-e" ]]; then
      vim ~/.crontab && $CRONTABCMD ~/.crontab
    else
      $CRONTABCMD $@
    fi
  }
  $CRONTABCMD ~/.crontab
fi
