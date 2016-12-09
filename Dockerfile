FROM centos:7

# Install neovim
RUN yum update -y && \
	yum -y install epel-release && \
	curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo && \
	yum -y install neovim

# Install node
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash && \
	export NVM_DIR="/root/.nvm" && [ -s "$NVM_DIR/nvm.sh"  ] && . "$NVM_DIR/nvm.sh" && \
	nvm install v6.9.0 

RUN yum -y install git

ADD . /root/.vim

WORKDIR /root/.vim

RUN mkdir -p ~/.config && \
	ln -s ~/.vim ~/.config/nvim && \
	ln -s ~/.vim/.vimrc ~/.vim/init.vim && \
	ls -l ~/.config 
	# git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim

RUN cd bundle/tern_for_vim && \
	export NVM_DIR="/root/.nvm" && [ -s "$NVM_DIR/nvm.sh"  ] && . "$NVM_DIR/nvm.sh" && \
	npm i -d --registry=https://registry.npm.taobao.org/

RUN cd bundle/youcompleteme && \
	git submodule update --init --recursive && \
	./install.py --gocode-completer --tern-completer
