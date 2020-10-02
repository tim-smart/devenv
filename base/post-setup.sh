# Install vim plugins
nvim +'PlugInstall --sync' +qa

# Install coc extensions
cd /root/.config/coc/extensions && yarn install
