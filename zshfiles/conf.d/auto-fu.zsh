# 
# config for incremental search with auto-fu.zsh
#

if zplug check "hchbaw/auto-fu.zsh" && ! type zle-line-init > /dev/null 2>&1; then
  function zle-line-init () {
    auto-fu-init
  }
  zle -N zle-line-init
  zstyle ':auto-fu:var' postdisplay $''
  zle -N zle-keymap-select auto-fu-zle-keymap-select
fi
zstyle ':completion:*' completer _list _complete _expand _approximate _match _prefix

# vim: et ts=2 sts=0 sw=2
