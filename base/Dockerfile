FROM archlinux

ADD setup.sh /setup.sh
RUN bash /setup.sh

ADD dotfiles/zsh/.zshrc /root/.zshrc
ADD dotfiles/nvim/init.vim /root/.config/nvim/init.vim
ADD dotfiles/coc/package.json /root/.config/coc/extensions/package.json

ADD post-setup.sh /post-setup.sh
RUN bash /post-setup.sh

WORKDIR /root/code

ENTRYPOINT [ "/usr/bin/zsh" ]
