all: build

build:
	cp ../../config/nvim/plugins.vim ./
	docker build -t alekspak/neovim .
	rm -f ./plugins.vim

push:
	docker push alekspak/neovim
