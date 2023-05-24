# Make alacritty+tmux replicate usual window behaviour:
# By default, each window gets its own session

if [[ ! -z $(tmux ls | egrep '^main: ') ]]; then
  main_exists=true
  #echo main exists
fi

if [[ ! -z $(tmux ls | egrep '^main: .* \(attached\)$') ]]; then
  main_is_attached=true
  #echo main is attached
fi

# When opening a new window, ask which session to attach to
# (unless no sessions exist, in which case automatically attach to main)
if [[ $main_exists && $main_is_attached ]]; then
  echo "#################"
  echo "# open sessions #"
  echo "#################"
  echo ""
  /opt/homebrew/bin/tmux ls
  echo ""

  read -p "Enter a session name above, or a new one: " session
  /opt/homebrew/bin/tmux new-session -A -s $session
else
  /opt/homebrew/bin/tmux new-session -A -s main
fi
