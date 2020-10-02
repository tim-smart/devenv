useradd -m tim

# packages
pacman -Syu --noconfirm \
	base-devel \
	curl \
	openssh \
	git \
	neovim \
	nodejs \
	npm yarn \
	python \
	tmux \
	zsh \
	powerline-fonts

# symlink nvim
ln -s /usr/bin/nvim /usr/bin/vim

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)

# vim-plug
curl -fLo \
	"${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
	--create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir /root/code
