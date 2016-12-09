ln -s `pwd` ~/.vim
ln -s `pwd`/.vimrc ~/.vimrc
git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim
nvim +PluginInstall +qall > /dev/null
ls bundle
# Install tern for vim
cd bundle/tern_for_vim
npm i
# Compile YouCompleteMe with golang and js support
cd ../youcompleteme
./install.py --gocode-completer --tern-completer

