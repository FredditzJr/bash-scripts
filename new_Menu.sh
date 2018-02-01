#!/bin/bash

chemin=$(pwd)
green="\033[32;40m"
red="\033[31;40m"
none="\033[0m"

function menu()
{
    OIFS=$IFS; IFS=$'\n';scripts=($(ls "scripts/"));IFS=$OIFS;
    scripts+=("Quit")
    COLUMNS=12
    echo "Hello $USER"
    sleep 1
    echo "which script do you want to run ? : "

    select script in "${scripts[@]}"; do
        case $script in
            "Quit") echo "Bye"; exit 0;;
	    *) bash scripts/$script/run.sh ;;
        esac
    done
}

function help()
{
    echo -e "Usage : bash $0 $green--[options]$none"
    echo
    echo -e  $green"--script [script name]"$none" 		: If you want to run a specific script."
    echo -e  $green"--help"$none"               		: display this help."
    echo
    echo -e $green"If you don't pass any argument, the script will be run in interactif mode"$none
    
}

if [ $# -eq 0 ]; then
    menu
else
    case "$1" in
        --script) bash $chemin/scripts/$2/run.sh;;
        --help | -h) help; exit 0 ;;
        *) echo -e $red"ERROR ! : Use --help for see option"$none; exit 1;;
    esac
fi
