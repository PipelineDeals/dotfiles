#colors
red=$(tput setaf 1)
green=$(tput setaf 2)
cyan=$(tput setaf 6)
pink=$(tput bold ; tput setaf 5)
reset=$(tput sgr0)

gitStatus() { git diff --quiet 2> /dev/null || echo ' *' ; }
gitBranch() { git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(gitStatus))/" ; }

PS1="[\[$green\]\T\[$reset\]] \[$red\]\u\[$reset\] [\[$cyan\]\w\[$reset\]]\[$pink\]\$(gitBranch)\[$reset\] \$ "
PS2=" > "

# the path is initially set to "/bin:/sbin:/usr/bin:/usr/sbin"
export PATH=/usr/local/bin:$PATH:./bin:$HOME/.rbenv/bin

# aliases
alias l="ls -l"
alias ll="ls -al"
alias reload="source ~/.bash_profile"
alias dropbox="cd ~/Dropbox"
alias s="subl ."
alias es="elasticsearch -f -D es.config=/usr/local/Cellar/elasticsearch/0.19.3/config/elasticsearch.yml"
alias redis="redis-server /usr/local/etc/redis.conf"
alias worker="QUEUE=* bundle exec rake resque:work"
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias phonegap="cd /Users/bhilkert/Dropbox/code/phonegap/lib/ios/bin"
alias sublime="cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User"
alias cleardns="dscacheutil -flushcache"
alias z="zeus"

source ~/.git-completion.sh

eval "$(rbenv init -)"
export RUBY_GC_MALLOC_LIMIT=60000000
export RUBY_FREE_MIN=200000