tmux kill-session -t _quick_
tmux new-session -d -s _quick_
tmux send-keys -t _quick_ "q "
tmux attach -t _quick_
