#!/bin/bash
########################################################
########## WEBSITE CHECKER v1.0 by FredditzJr ##########
########################################################

green="\033[32;40m"
red="\033[31;40m"
none="\033[0m"
blue="\033[36;40m"
COLUMNS=12
chemin=$(pwd)

function welcome() # Welcome  Message
{
    clear
    echo -e $blue"#########################################################################################################################################################";
    echo -e "#"$none"      _________                            .__      _________                            "$blue"#                                                           #";
    echo -e "#"$none"     /   _____/____    _____  __ __  ____  |  |    /   _____/__ ________   ___________   "$blue"#                                                           #";
    echo -e "#"$none"     \_____  \\__  \  /     \|  |  \_/ __ \ |  |   \_____  \|  |  \____ \_/ __ \_  __ \   "$blue"#                                                           #";
    echo -e "#"$none"     /        \/ __ \|  Y Y  \  |  /\  ___/|  |__  /        \  |  /  |_> >  ___/|  | \/  "$blue"#                                                           #";
    echo -e "#"$none"    /_______  (____  /__|_|  /____/  \___  >____/ /_______  /____/|   __/ \___  >__|     "$blue"#                                                           #";
    echo -e "#"$none"            \/     \/      \/            \/               \/      |__|        \/         "$blue"#                                                           #";
    echo -e "#"$none"     __      __      ___.     _________ .__                   __                         "$blue"#"  "Version 1.0                                               #";
    echo -e "#"$none"    /  \    /  \ ____\_ |__   \_   ___ \|  |__   ____   ____ |  | __ ___________         "$blue"#                                                           #";
    echo -e "#"$none"    \   \/\/   // __ \| __ \  /    \  \/|  |  \_/ __ \_/ ___\|  |/ // __ \_  __ \        "$blue"#"  "Author :FredditzJr (samuel)                               #";
    echo -e "#"$none"     \        /\  ___/| \_\ \ \     \___|   Y  \  ___/\  \___|    <\  ___/|  | \/        "$blue"#                                                           #";
    echo -e "#"$none"      \__/\  /  \___  >___  /  \______  /___|  /\___  >\___  >__|_ \\___  >__|            "$blue"#                                                           #";
    echo -e "#"$none"           \/       \/    \/          \/     \/     \/     \/     \/    \/               "$blue"#                                                           #";
    echo -e $blue"#########################################################################################################################################################";
    echo -e $blue "Hello $USER" $none
}

function menu() # Choice of the option in the menu
{
    check=$(echo -e $blue"check sites config.txt"$none)
    Enter=$(echo -e $blue"Enter a site"$none)
    Quit=$(echo -e $blue"Quittez (q,Q)"$none)
    PS3="---> select an option : "
    OIFS=$IFS; IFS=$'\n';$things;IFS=$OIFS;
    echo -e "$red                                    :|: MAIN MENU :|:$none"
    echo "------------------------------------------------------------------------------------------"
    select Choices in "$check" "$Enter" "$Quit" ;do
        case $REPLY in
            1) checkandsend
               break ;;

            2) Grab
               send_mail
               break ;;

            3|Q*|q*) echo -e "$blue Bye ! $none"
               break;;

            *) echo -e "$blue You choice is not available ,$none  $red you must learn to read ^.^ $none";;
         esac
     done
}

function check() # Check the sites in the config.txt .
{
    liste=$(cat config.txt)

    for website in $liste; do

        result=$(curl -Is $website  | head -n 1 | cut -d ' ' -f 2)

        if [ "$result" == "200" ]; then
            echo -e "$green $website functionnal site ! $none"
        else
            echo -e "$red $website Down !!$none"
            down+=($website)
        fi

    done
}

function Grab()  # shows and check if the site is functionnal .
{
    if [ $# -eq 0  ]; then
        echo -e "$green Enter a site :example:www.google.fr $none"
        read type
    else
         type=$1
    fi

    result=$(curl -Is $type  | head -n 1 | cut -d ' ' -f 2)

    if [ "$result" == "200" ]; then
         echo -e "$green functional site ! $none"
    else
         echo -e "$red $type Down !! $none"
         down+=($type)
         sending
    fi
}

function send_mail() # sending a mail for the down site ONLY !
{
    emails=$(cat emails.txt)
    for liste in $emails; do
        echo "$down :$DATE" | mail -s "Website Down !" $liste
    done
}

function Sending() # for make wait the user
{
    robot=$(cat dessin.txt)
    if [ $down="`echo $var | grep motif`" ];then
        echo -e "$blue Sending down site , wait please ... $none"
        tput blink; echo "$robot"; tput sgr0
        send_mail
    else
        exit 0
    fi
}

function checkandsend() # check + send function
{
    check
    Sending
}

function help()   # show the main menu --help
{
    echo -e "Usage : bash $0 $green--[options]$none"
    echo
    echo -e  $green" --all "$none"              : If you want to check de site in config.txt ."
    echo -e  $green" --site "$none"                            :Enter a site "
    echo -e  $green" --help" $none"                               : Show this help."
    echo
    echo -e  $green "If you dont pass any argument, the script will be run in interactif mode" $none
}

if [ $# -eq 0 ]; then
    welcome
    menu
else #option for running more fast and easy
    case "$1" in
        --all) checkandsend ;;
        --site) Grap $2 ;;
        --help | -h) help ; exit 0 ;;
        *) echo -e $red"ERROR ! : Use --help for see option"$none ; exit 1;;
    esac
fi
echo -e "$blue ############################################################ $none $red Bye ! $none $blue ############################################################ $none" 
