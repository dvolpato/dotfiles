function tmux-update () { 
    echo "Updating to latest tmux environment...";
    export IFS=",";
    for line in $(tmux showenv -t $(tmux display -p "#S") | tr "\n" ",");
    do
        if [[ $line == -* ]]; then
            echo "$line unset"
            unset $(echo $line | cut -c2-);
        else
            echo "export $line"
            export $line;
        fi;
    done;
#    local ssh_cli=`env | grep SSH_CLIENT`
#    export "$ssh_cli"    
    unset IFS;
    source ~/.bash_aliases
    echo "...Done"
}

alias tmup='tmux-update'
