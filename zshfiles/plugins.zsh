# plugin initialization script

# manage itself
zplug "zplug/zplug"

# plugins
zplug "mollifier/anyframe"
zplug "mollifier/cd-gitroot"
zplug "b4b4r07/emoji-cli", if:"which jq"
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-completions"
zplug "mrowa44/emojify", as:command
zplug "hchbaw/auto-fu.zsh", at:"pu"
zplug "rupa/z", use:z.sh
zplug "andrewferrier/fzf-z", on:"rupa/z"

# prezto modules
zplug "modules/utility", from:prezto
zplug "modules/completion", from:prezto, on:"modules/utility"
zplug "modules/prompt", from:prezto
zplug "modules/git", from:prezto

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

# vim: et ts=2 sts=0 sw=2 ft=zsh
