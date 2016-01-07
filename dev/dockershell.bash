#!/usr/bin/env bash

SCRIPT_DIR=$( command cd $( dirname "${BASH_SOURCE[0]}" ) && pwd )
PROJECT_DIR=$( command cd $SCRIPT_DIR/.. && pwd)
VAR_FILE=dockershellenv

function ee { echo "[ $1 ]" && eval $1; } # echo and eval
function setenv { export "$1=$2"; }

function load_env {
    [ ! -f "$SCRIPT_DIR/$VAR_FILE" ] && { echo "missing $VAR_FILE"; exit 1; }
    unset tag && unset opts
    source "$SCRIPT_DIR/$VAR_FILE"
    [ -z $tag ] && { echo "tag not defined"; exit 1; }
}

function dockershell_build {
    load_env; ee "cd $PROJECT_DIR && docker build --tag $tag .";
}

function dockershell_run {
    load_env; ee "docker run -it --rm $opts $tag bash";
}

function dockershell_daemon {
    load_env; ee "docker run -d $opts $tag";
}

function dockershell_osx_dev {
    load_env; ee "docker run -it --rm -v $PROJECT_DIR:/app $opts $tag bash";
}

function dockershell_osx_sync {
    load_env; ee "cd $PROJECT_DIR && docker-osx-dev";
}
