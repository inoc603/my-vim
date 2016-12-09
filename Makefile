
bundle: .vimrc
	cat .vimrc | grep ^Plugin | cut -f 2 -d "'" | \
	while read LINE; \
	do git clone --depth 1 https://github.com/$$LINE.git bundle/$$(basename $$LINE); \
	done

docker:
	docker build -t nvim .
