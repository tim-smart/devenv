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
	python-pip \
	tmux \
	zsh \
	powerline-fonts

# symlink nvim
ln -s /usr/bin/nvim /usr/bin/vim

# Install python neovim
pip install neovim

# zinit
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

# vim-plug
curl -fLo \
	"${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
	--create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir /root/code
