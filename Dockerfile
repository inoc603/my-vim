FROM alpine:edge
ENV CMAKE_EXTRA_FLAGS=-DENABLE_JEMALLOC=OFF
# RUN echo "http://dl-4.alpinelinux.org/alpine/edge/" >> /etc/apk/repositories
RUN apk add --update-cache
RUN apk add git
RUN apk add libtermkey unibilium

ADD ./tmp/bin/nvim /usr/local/bin/nvim
ADD ./tmp/share/nvim /usr/local/share
ADD ./tmp/lib/* /usr/local/lib/

ADD . /root/.vim

WORKDIR /root/.vim

RUN mkdir -p ~/.config && \
	ln -s ~/.vim ~/.config/nvim && \
	ln -s ~/.vim/.vimrc ~/.vim/init.vim && \
	ls -l ~/.config  && \
	git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim

RUN apk add \
	python \
	py2-pip \
	g++

RUN apk add python-dev

RUN pip install neovim

RUN nvim +PluginInstall +qa
