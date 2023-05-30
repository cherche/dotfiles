alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"
alias bup="brew update && brew upgrade && brew cleanup; brew doctor"

alias relaunchpad="defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock"
alias redock="killall Dock"
alias reyabai="yabai --stop-service && yabai --start-service"
alias retmux="tmux a -t main || tmux new -s main"
alias rebash="source ~/.bashrc"
alias rezsh="source ~/.zshrc"
alias refinder="killall Finder"

alias bh="python3 ~/dotfiles/bin/bookmark-helper.py"

alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox"
# zathura, but with automatic switching between light/dark themes
alias zathura="bzathura"
alias matlab="/Applications/MATLAB_R2023a.app/bin/matlab -nojvm -nodesktop"

# fh - repeat history
fh() {
    eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}
# fcd - fuzzy cd
fcd() {
    dir="$(find * -type d | fzf)"
    cd "$dir"
}
# scopen - find (in ~/school/) and open with zathura
scopen() {
    zopen ~/school "$*"
}

print_colours() {
    for i in {0..255}; do
        printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
    done
}

vscode() {
    open "$1" -a /Applications/VSCodium.app
}
