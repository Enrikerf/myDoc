#!/bin/bash

# Git root directory to use as a base of repositories to update
ROOT_DIR=$(pwd)

GREEN=`tput setaf 2`;
NC=`tput sgr0`;

DIVISOR=${GREEN}"================================================================================================================================="${NC};

function run_git_recursive() {
    if [[ -z "$1" ]]; then
        echo "Usage: $FUNCNAME <dir>" >&2;
        return 1;
    fi;
    if [[ ! -d "$1" ]]; then
        echo "Invalid dir specified: '${1}'";
        return 1;
    fi;
    (
        cd "$1";
        if [[ -d "$1/.git" ]]; then
            echo "${GREEN}core${NC} [$(git ${@:2})]";
            echo $DIVISOR
        fi
        for sub in *; do
            [[ -d "${sub}/.git" ]] || continue;
            echo "${GREEN}${sub}${NC} [$(cd "$sub"; git ${@:2})]";
            echo $DIVISOR
        done;
    );

}

function git_branches() {
    if [[ -z "$1" ]]; then
        echo "Usage: $FUNCNAME <dir>" >&2;
        return 1;
    fi;
    if [[ ! -d "$1" ]]; then
        echo "Invalid dir specified: '${1}'";
        return 1;
    fi;
    (
        cd "$1";
        if [[ -d "$1/.git" ]]; then
                echo "${GREEN}core${NC} [$(git branch | grep '^\*' | cut -d ' ' -f2)]";
        fi
        for sub in *; do
            [[ -d "${sub}/.git" ]] || continue;
            echo "$sub [$(cd "$sub"; git  branch | grep '^\*' | cut -d' ' -f2)]";
        done;
    );
}

function git_pull() {
    if [[ -z "$1" ]]; then
        echo "Usage: $FUNCNAME <dir>" >&2;
        return 1;
    fi;
    if [[ ! -d "$1" ]]; then
        echo "Invalid dir specified: '${1}'";
        return 1;
    fi;
    (
        cd "$1";
        if [[ -d "$1/.git" ]]; then
                echo "${GREEN}core${NC} [$(git pull)]";
                echo $DIVISOR;
        fi
        for sub in *; do
            [[ -d "${sub}/.git" ]] || continue;
            echo "$sub [$(cd "$sub"; git  pull)]";
            echo $DIVISOR;
        done;
    );
}

function git_checkout() {
    if [[ -z "$1" ]]; then
        echo "Usage: $FUNCNAME <dir> <branc>" >&2;
        return 1;
    fi;
    if [[ ! -d "$1" ]]; then
        echo "Invalid dir specified: '${1}'";
        return 1;
    fi;
    (
        cd "$1";
        if [[ -d "$1/.git" ]]; then
                echo "${GREEN}core${NC} [$(git checkout $2)]";
                echo $DIVISOR;
        fi
        for sub in *; do
            [[ -d "${sub}/.git" ]] || continue;
            echo "$sub [$(cd "$sub"; git  checkout $2)]";
            echo $DIVISOR;
        done;
    );
}

case $1 in
    pull)
        git_pull $ROOT_DIR;
        ;;
    branch)
        git_branches $ROOT_DIR;
        ;;
    checkout)
        git_checkout $ROOT_DIR $2;
        ;;
    status)
        run_git_recursive $ROOT_DIR status;
        ;;
    discard-nuisances)
        run_git_recursive $ROOT_DIR checkout -- package-lock.json;
        ;;
    check-prod-update)
        run_git_recursive $ROOT_DIR checkout -- package-lock.json;
        git_checkout $ROOT_DIR master;
        git_checkout $ROOT_DIR prod;
        git_pull $ROOT_DIR;
        run_git_recursive $ROOT_DIR checkout -- package-lock.json;
        ;;
    *)
        echo "Usage:";
        echo `basename "$0"` "pull     to update your repositories";
        echo `basename "$0"` "branch   to view your repository active branches";
        echo `basename "$0"` "checkout to change all repositories to the target branch";
        echo `basename "$0"` "status   to view all repositories status";
        echo `basename "$0"` "discard-nuisances to discard annoying file changes";
        echo `basename "$0"` "check-prod-update to check prod/master and discard annoying file changes";
esac
