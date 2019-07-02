echo "Installing allai5's GNU/Linux setup..."

sudo apt-get install tmux git zsh build-essential cmake python3-dev
cd ~/ && git clone --recursive https://github.com/ycm-core/ycmd
cd ~/ycmd && python3 build.py --all

rm -rf ~/.vim ~/.vimrc ~/.bashrc ~/.zshrc ~/.tmux.conf
ln -s /mnt/c/Users/alice/Documents/dotfiles/.vim/ ~/vimfiles/
ln -s /mnt/c/Users/alice/Documents/dotfiles/.vimrc ~/.vimrc
ln -s /mnt/c/Users/alice/Documents/dotfiles/.bashrc ~/.bashrc
ln -s /mnt/c/Users/alice/Documents/dotfiles/.zshrc ~/.zshrc
ln -s /mnt/c/Users/alice/Documents/dotfiles/.tmux.conf ~/.tmux.conf

wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | zsh

cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zdharma/fast-syntax-highlighting

cd ~/

echo "Done installing! :)"
