source ~/.zinit/bin/zinit.zsh
source ~/.fzf.zsh

setopt promptsubst

zinit wait lucid for \
    OMZL::git.zsh \
    OMZP::git

PS1="READY >" # provide a simple prompt till the theme loads

zinit wait'!' lucid for \
    OMZL::prompt_info_functions.zsh \
    OMZT::robbyrussell

zinit wait lucid for \
  atinit"zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
    OMZP::colored-man-pages \
  as"completion" \
    OMZP::docker/_docker

export EDITOR=nvim
