
bundle: .vimrc
	cat .vimrc | grep ^Plugin | cut -f 2 -d "'" | \
	while read LINE; \
	do git clone --depth 1 https://github.com/$$LINE.git bundle/$$(basename $$LINE); \
	done

docker:
	docker build -t nvim .

base: Dockerfile-build
	docker build -f Dockerfile-build -t nvim-build .

build: base
	rm -rf tmp/*
	docker run -v $(CURDIR):/tmp/my-vim --rm nvim-build sh -c /tmp/my-vim/docker.sh
	docker build -t nvim .
