#!/bin/bash

# Remember to load org.n8n.ta before screaming in frustration!
# > cp ~/dotfiles/launchd/org.n8n.ta.plist ~/Library/LaunchAgents/
# > launchctl load ~/Library/LaunchAgents/org.n8n.ta.plist
tmux new-session -d -s n8n 'n8n start'
