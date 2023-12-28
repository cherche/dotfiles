#/usr/bin/env bash

ln -svf ~/dotfiles/shell/alias.sh ~/.config/zsh/
ln -svf ~/dotfiles/shell/env.sh ~/.config/zsh/
ln -svf ~/dotfiles/shell/.bashrc ~/.bashrc
ln -svf ~/dotfiles/shell/.zshrc_ohmyzsh ~/.zshrc
ln -svf ~/dotfiles/shell/.inputrc ~
ln -svf ~/dotfiles/tmux/.tmux.conf ~
ln -svf ~/dotfiles/tmux/.tmux.reset.conf ~
ln -svf ~/dotfiles/tmux/.tmux.remote.conf ~

ln -svf ~/dotfiles/git/.gitconfig ~
ln -svf ~/dotfiles/git/.gitignore ~
ln -svf ~/dotfiles/.crontab ~

ln -svf ~/dotfiles/hyper/.hyper.js ~
ln -svf ~/dotfiles/spicetify/config-xpui.ini ~/.config/spicetify/
ln -svf ~/dotfiles/zathura/zathurarc ~/.config/zathura/
ln -svf ~/dotfiles/alacritty/alacritty.toml ~/.config/alacritty/
ln -svf ~/dotfiles/inkscape/inkscape-preferences.xml "$HOME/Library/Application Support/org.inkscape.Inkscape/config/inkscape/preferences.xml"
ln -svf ~/dotfiles/sage/init.sage ~/.sage/
ln -svf ~/dotfiles/skhd/skhdrc ~/.config/skhd/
ln -svf ~/dotfiles/yabai/yabairc ~/.config/yabai/
ln -svf ~/dotfiles/borders/bordersrc ~/.config/borders/

ln -svf ~/dotfiles/mpv/mpv.conf ~/.config/mpv/
ln -svf ~/dotfiles/mpv/scripts/ ~/.config/mpv/

ln -svf ~/dotfiles/vim/vimrc ~/.vim/
ln -svf ~/dotfiles/vim/after/ ~/.vim/

