echo "Installing allai5's GNU/Linux setup..."

CURR_DIR=$PWD
sudo apt-get install tmux git zsh
wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | zsh

rm -rf ~/.vim ~/.vimrc ~/.bashrc ~/.zshrc ~/.tmux.conf
ln -s $CURR_DIR/.vim ~/.vim
ln -s $CURR_DIR/.vimrc ~/.vimrc
ln -s $CURR_DIR/.bashrc ~/.bashrc
ln -s $CURR_DIR/.zshrc ~/.zshrc
ln -s $CURR_DIR/.tmux.conf ~/.tmux.conf
ln -s $CURR_DIR/.tmux-status.conf ~/.tmux-status.conf

cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zdharma/fast-syntax-highlighting

cd $CURR_DIR

echo "Done installing! :)"
