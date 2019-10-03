echo "Installing allai5's GNU/Linux setup..."

CURR_DIR=$PWD
sudo apt-get install tmux git

rm -rf ~/.vim ~/.vimrc ~/.bashrc ~/.zshrc ~/.tmux.conf
ln -s $CURR_DIR/.vim ~/.vim
ln -s $CURR_DIR/.vimrc ~/.vimrc
ln -s $CURR_DIR/.bashrc ~/.bashrc
ln -s $CURR_DIR/.tmux.conf ~/.tmux.conf
ln -s $CURR_DIR/.tmux-status.conf ~/.tmux-status.conf

cd $CURR_DIR

echo "Done installing! :)"
