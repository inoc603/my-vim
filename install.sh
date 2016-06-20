ln -s `pwd` ~/.vim
ln -s `pwd`/.vimrc ~/.vimrc
git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim
vim +PluginInstall +qall
cd bundle/tern_for_vim
npm i
