alias l='ls -lrta'
alias ws='cd ~/workspace'
alias apibe='cd ~/workspace/apibe'
alias p='php bin/console'
alias php-restart='brew services restart php@7.4'
alias nginx-restart='sudo brew services restart nginx-full'
alias dev-server='ssh enrikerf@5.135.187.196'
alias toggle-XDebug='sh /Users/enrikerf/scripts/toggle-Xdebug'
alias prod-server='cd /Users/enrikerf/.ssh/con && ./buscoextra.es'
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


export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"

