# Install vim plugins
nvim +'PlugInstall --sync' +qa

# Install coc extensions
cd /root/.config/coc/extensions && npm install

# Install zsh plugins
zsh -ic exit

# git config
git config --global user.name "Tim Smart"
git config --global user.email "tim.smart@arisechurch.com"
