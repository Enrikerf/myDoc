# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ws='cd ~/workspace'

# php workspace common alias
alias p='php bin/console'
alias php-restart='brew services restart php@7.4'
alias nginx-restart='sudo brew services restart nginx-full'

# personal scripts
alias toggle-XDebug='sh /Users/enrikerf/scripts/toggle-Xdebug'
alias upWorkspace='sh /Users/enrikerf/scripts/upWorkspace'
alias downWorkspace='sh /Users/enrikerf/scripts/downWorkspace'


setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'

