# Manual grep search against file names
# Accepts 2 arguments, string to match (required) and directory to search in (default: .)
rar() {
  grep -R -H --exclude-dir={log,.git,tmp,node_modules} $1 ${2:-.}
}

# Opens each file returned from rar into it's own vim buffer
# Accepts 1 argument, string to match (required)
vr() {
  vim `rar $1 | cut -d ':' -f1 | uniq` +/$1
}

# SSH into pairbear for different users.  Should be moved to ~/.ssh/config
# Accepts 1 argument, string to set user (default: pair)
hh() {
  ssh ${1:-pair}@pairbear.co
}

# Run rspec without failing error code
# Accepts unlimited arguments
rsp() {
  bundle exec rspec --color $@ || set exit code 0
}
