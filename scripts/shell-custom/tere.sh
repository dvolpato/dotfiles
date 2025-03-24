# tere - a faster alternative to cd + ls
# https://github.com/mgunyho/tere

TERE_BIN=$HOME/.cargo/bin/tere

tere() {
    local result=$($TERE_BIN "$@")
    [ -n "$result" ] && cd -- "$result"
}

