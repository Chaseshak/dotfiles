# Navigation
# alias dcom='cd /Users/chaseschachenman/Projects/dot-com'
# alias rater='cd /Users/chaseschachenman/Projects/rater-api'
alias ls='ls -alh '

# Rails
alias be='bundle exec'
alias cop='bundle exec rubocop -D --parallel'
alias kill_rails='pkill -9 -f puma'
alias shuffle='./wooten_shuffle'
alias shuffle_fase='echo "y" | ./wooten_shuffle'

# JavaScript
alias lint_js='yarn pretty-check --write'

# Emacs
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'

# Heroku Console
alias prod_console_w="heroku run console -w -a bright-policy"
alias prod_console="heroku run console -a bright-policy"
alias h_console="heroku run console -a "   

# AWS Cli
alias aws_dev="aws --profile dev"
alias aws_staging="aws --profile staging"
alias aws_prod="aws --profile prod"

# Terraform
alias tf="terraform"

# DB
alias sdev='psql bp_dev'
alias stest='psql bp_test'

# Git
alias gprm='git checkout `head-branch`; git pull --rebase origin `head-branch`'
alias rbm='CB=$(git rev-parse --abbrev-ref HEAD); git checkout `head-branch`; git pull --rebase origin `head-branch`; git checkout $CB;  git rebase `head-branch`'
alias gb='git checkout -b '
alias gcf='git checkout $(git branch | fzf)'
alias gdmb='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'
alias gdrb='git branch -r | awk "{print $1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print $1}" | xargs git branch -d'
alias assigned='gh issue list -a "@me"'
alias authored='gh pr list -A "@me"'
alias authored_by='gh pr list -A'
alias gpf='git push --force-with-lease'
alias gp='git push'
alias gff='git pull --ff-only'
alias gcan='git commit --amend -n --no-edit'
alias gap='git add --intent-to-add . && git add --patch'

# Misc.
alias pip=pip3
alias python=/opt/homebrew/bin/python3
alias ed_alias="vim $HOME/.oh-my-zsh-custom/aliases.zsh"
alias rake='noglob rake'
alias swagger="docker run --rm -it -e GOPATH=$HOME/go:/go -v $HOME:$HOME -w $(pwd) quay.io/goswagger/swagger"
alias dotfiles="ls -dalh .*"
alias psql_tonic="psql -h tonic-1.cluster-c0ahyml649ce.us-east-1.rds.amazonaws.com -U postgres"

# Logs
alias tail_rater_stg='saw watch data/staging/rater-api'

# Golang
alias gonymizer="/Users/chaseschachenman/go/src/github.com/smithoss/gonymizer/bin/gonymizer"
