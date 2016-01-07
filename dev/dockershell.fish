#!/usr/bin/env fish

set SCRIPT_DIR (dirname (realpath (status -f)))
set PROJECT_DIR (dirname $SCRIPT_DIR)
set VAR_FILE dockershellenv

function ee; echo "[ $argv ]" ;and eval $argv; end
function setenv; set -gx $argv; end

function load_env
    if not test -f "$SCRIPT_DIR/$VAR_FILE"
        echo "missing $VAR_FILE" ;and exit 1
    end

    set -e tag ;and set -e opts
    source "$SCRIPT_DIR/$VAR_FILE"
    if test -z $tag ;and echo "tag not defined" ;and exit 1; end
end

function dockershell_build
    load_env ;and ee "cd $PROJECT_DIR ;and docker build --tag $tag .";
end

function dockershell_run
    load_env ;and ee "docker run -it --rm $opts $tag bash";
end

function dockershell_daemon
    load_env ;and ee "docker run -d $opts $tag";
end

function dockershell_osx_dev
    load_env ;and ee "docker run -it --rm -v $PROJECT_DIR:/app $opts $tag bash";
end

function dockershell_osx_sync
    load_env ;and ee "cd $PROJECT_DIR ;and docker-osx-dev";
end
