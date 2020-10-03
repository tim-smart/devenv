useradd -m -G wheel tim
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

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
	go \
	tmux \
	zsh \
	bat \
	fasd \
	expac yajl \
	powerline-fonts

# symlink nvim
ln -s /usr/bin/nvim /usr/bin/vim

# Install python neovim
pip install neovim

# locale and timezone
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen
ln -sf /usr/share/zoneinfo/Pacific/Auckland /etc/localtime
