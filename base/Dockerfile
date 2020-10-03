FROM archlinux

ADD setup.sh /setup.sh
RUN bash /setup.sh

USER tim
WORKDIR /home/tim/code

ADD dotfiles/zsh/zshrc /home/tim/.zshrc
ADD dotfiles/nvim/init.vim /home/tim/.config/nvim/init.vim
ADD dotfiles/coc/package.json /home/tim/.config/coc/extensions/package.json

ADD post-setup.sh /post-setup.sh
RUN bash /post-setup.sh

ENV COLORTERM truecolor
ENV TERM xterm-256color
ENV BUNDLE_PATH .bundle

ENTRYPOINT [ "/usr/bin/zsh" ]
