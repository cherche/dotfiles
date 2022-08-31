alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"
alias bup="brew update && brew upgrade && brew cleanup; brew doctor"

alias relaunchpad="defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock"
alias redock="killall Dock"
alias reyabai="brew services restart yabai && sudo yabai --load-sa"
alias retmux="tmux a -t main || tmux new -s main"
alias rebash="source ~/.bashrc"
alias rezsh="source ~/.zshrc"
alias refinder="killall Finder"

alias bh="python3 ~/dotfiles/bin/bookmark-helper.py"

# zathura, but with automatic switching between light/dark themes
alias zathura="bzathura"

# fh - repeat history
fh() {
    eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}
# fcd - fuzzy cd
fcd() {
    dir="$(find * -type d | fzf)"
    cd "$dir"
}
