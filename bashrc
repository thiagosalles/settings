# .bashrc

export GREP_OPTIONS='--color=auto'
#export LC_CTYPE=en_US.iso-8859-1
#export LANG="$LC_CTYPE"
export LANG=en_US.UTF-8

### Added by the Heroku Toolbelt
if [ -d "/usr/local/heroku/bin" ]; then
	export PATH="/usr/local/heroku/bin:$PATH"
fi

# Composer bin
if [ -d "$HOME/.composer/vendor/bin" ]; then
	export PATH="$HOME/.composer/vendor/bin:$PATH"
fi

# Aliases for Node
alias i='npm install'
alias y="yarn"

# Aliases for VIM
alias vi='vim'
alias vimdiff="vimdiff -c 'windo set wrap'"
alias :tabe='vi'

# Aliases for GIT
alias pega="git fetch origin; git pull --rebase origin \$(parse_git_branch)"
alias manda="git push origin \$(parse_git_branch)"
alias desfaz="git reset --hard origin/\$(parse_git_branch)"
alias tags='git tag | sort -V'
alias gg='git grep'
alias gd='git diff'
#alias open_modified="vim -p \`git status --porcelain | sed -ne 's/^ M /\/home\/tlima\/bomnegocio\//p'\`"
#alias add_new="git add -N \`git status --porcelain | sed -ne 's/^?? /\/home\/tlima\/bomnegocio\//p'\`"

# Other Aliases
#alias ls="ls -alG"
alias compose-restart='docker-compose down --remove-orphans && docker-compose up -d --build'
alias olx="cd $HOME/Projects/OLX/"
alias acc="cd $HOME/Projects/OLX/Accounts/"
alias chat="cd $HOME/Projects/OLX/Messaging/"
alias apps="cd $HOME/Projects/OLX/Apps/olx-mobile"
alias ads="cd $HOME/Projects/OLX/Ads/"

# Functions
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
get_current_date() {
	date +%Y%m%d
}
function apagabranch() {
	git push origin :$1
	git branch -D $1
	echo git branch -D $1
}

function dbash() {
	docker exec -ti $1 bash
}

if [ -f ~/dotfiles/bashcolors ]; then
        . ~/dotfiles/bashcolors
fi

if [ -f ~/dotfiles/git-prompt.sh ]; then
	. ~/dotfiles/git-prompt.sh
fi

if [ -f ~/Projects/OLX/olx-vpn-dns/olx_vpn_dns.sh ]; then
	alias vpn="$HOME/Projects/OLX/olx-vpn-dns/olx_vpn_dns.sh"
fi


if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh ]; then
	source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
fi

# Define basic PS1 with coloring: [User ~/Folder]
PS1="[$Green\u$Color_Off@$Cyan\h$Color_Off $Blue\w$Color_Off] "
# Define git stuff, if is in a git folder, it shows the name of the branch.
# And color it yellow when have no changes, and red if there is.
PS1=$PS1'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Yellow'"$(__git_ps1 "(%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'$IRed'"$(__git_ps1 "(%s)"); \
  fi)"; \
fi)'
export PS1=$PS1$Color_Off' \$ ';

