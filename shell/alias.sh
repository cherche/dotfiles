alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"
alias bup="brew update && brew upgrade && brew cleanup; brew doctor"

alias relaunchpad="defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock"
alias redock="killall Dock"
#alias reyabai="brew services restart xorpse/formulae/yabai && sudo yabai --load-sa"
alias retmux="tmux a -t main"
alias rebash="source ~/.bashrc"
alias rezsh="source ~/.zshrc"
