# When opening a new window, ask which session to attach to
# (unless no sessions exist, in which case automatically attach to main)

echo "#################"
echo "# open sessions #"
echo "#################"
echo ""
/opt/homebrew/bin/tmux ls
echo ""

read -p "Enter a session name above, or a new one: " session

/opt/homebrew/bin/tmux new-session -A -s $session

