echo "Installing allai5's GNU/Linux setup..."

CURR_DIR=$PWD
sudo apt-get install tmux git

rm -rf ~/.config/nvim
ln -s $CURR_DIR/nvim ~/.config/nvim

cd $CURR_DIR

echo "Done installing! :)"
