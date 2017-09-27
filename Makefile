
define link
	@ if [ -L $(2) ]; then \
		echo "Remove link $(2)"; \
		rm -f $(2); \
	fi
	@ ln -s $(1) $(2) && \
		echo "Link $(1) to $(2)"
endef

clean:
	rm -rf bundle

bundle: .vimrc config/plugins.vim
	(cat .vimrc; echo; cat config/plugins.vim) | grep ^Plugin | cut -f 2 -d "'" | \
	while read LINE; \
	do git clone --recursive --depth 1 https://github.com/$$LINE.git bundle/$$(basename $$LINE); \
	done

docker:
	docker build -t nvim .

base: Dockerfile-build
	docker build -f Dockerfile-build -t nvim-build .

build: 
	rm -rf tmp/*
	docker run -v $(CURDIR):/tmp/my-vim --rm nvim-build sh -c /tmp/my-vim/docker.sh
	docker build -t nvim .

ycm:
	cd bundle/youcompleteme && \
		python install.py --tern-completer

tern:
	cd bundle/tern_for_vim && \
		npm i

vim-go:
	go get -v github.com/nsf/gocode
	go get -v github.com/alecthomas/gometalinter
	go get -v golang.org/x/tools/cmd/goimports
	go get -v golang.org/x/tools/cmd/guru
	go get -v golang.org/x/tools/cmd/gorename
	go get -v github.com/golang/lint/golint
	go get -v github.com/rogpeppe/godef
	go get -v github.com/kisielk/errcheck
	go get -v github.com/jstemmer/gotags
	go get -v github.com/klauspost/asmfmt/cmd/asmfmt
	go get -v github.com/fatih/motion
	go get -v github.com/fatih/gomodifytags
	go get -v github.com/zmb3/gogetdoc
	go get -v github.com/josharian/impl
	go get -v github.com/dominikh/go-tools/cmd/keyify

install:
	$(call link,$(CURDIR),~/.vim)
	$(call link,~/.vim/.vimrc,~/.vimrc)
	mkdir -p ~/.config
	$(call link,~/.vim,~/.config/nvim)
	$(call link,~/.vim/.vimrc,~/.vim/init.vim)
