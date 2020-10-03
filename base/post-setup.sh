cd /home/tim
sudo chown -R tim:tim .config

# zinit
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

# vim-plug
curl -fLo \
	"$HOME/.local/share/nvim/site/autoload/plug.vim" \
	--create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins
nvim +'PlugInstall --sync' +qa

# Install coc extensions
cd /home/tim/.config/coc/extensions && npm install

# Install zsh plugins
zsh -ic exit

# git config
git config --global user.name "Tim Smart"
git config --global user.email "tim.smart@arisechurch.com"

# aur yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# rbenv
yay -S --noconfirm \
	rbenv ruby-build
