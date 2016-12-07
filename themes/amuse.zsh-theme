# vim:ft=zsh ts=2 sw=2 sts=2

current_ip_addr() {
    ip -o addr show | grep -v inet6 |cut -d' ' -f2,7 | cut -d'/' -f1 | grep -v lo | paste -d"|" -s | sed "s/|/ | /g"
}

rvm_current() {
  rvm current 2>/dev/null
}

rbenv_version() {
  rbenv version 2>/dev/null | awk '{print $1}'
}

PROMPT='
%{$fg[yellow]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) ⌚ %{$fg_bold[red]%}%*%{$reset_color%} 📡  %{$fg[green]%}$(current_ip_addr)%{$reset_color%}
%{$fg[cyan]%}❯%{$reset_color%} '

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

if [ -e ~/.rvm/bin/rvm-prompt ]; then
  RPROMPT='%{$fg_bold[red]%}‹$(rvm_current)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    RPROMPT='%{$fg_bold[red]%}$(rbenv_version)%{$reset_color%}'
  fi
fi

