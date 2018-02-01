#!/bin/bash
########################################################
########## WEBSITE CHECKER v1.0 by FredditzJr ##########
########################################################

green="\033[32;40m"
red="\033[31;40m"
none="\033[0m"
blue="\033[36;40m"
COLUMNS=12

function welcome()
{
    clear
    echo -e $blue"##########################################################################################";
    echo -e "#"$none"     _________                            .__      _________                            "$blue"#";
    echo -e "#"$none"    /   _____/____    _____  __ __   ____ |  |    /   _____/__ ________   ___________   "$blue"#";
    echo -e "#"$none"    \_____  \\__  \  /     \|  |  \_/ __ \|  |    \_____  \|  |  \____ \_/ __ \_  __ \   "$blue"#";
    echo -e "#"$none"    /        \/ __ \|  Y Y  \  |  /\  ___/|  |__  /        \  |  /  |_> >  ___/|  | \/  "$blue"#";
    echo -e "#"$none"   /_______  (____  /__|_|  /____/  \___  >____/ /_______  /____/|   __/ \___  >__|     "$blue"#";
    echo -e "#"$none"           \/     \/      \/            \/               \/      |__|        \/         "$blue"#";
    echo -e "#"$none"    __      __      ___.     _________ .__                   __                         "$blue"#";
    echo -e "#"$none"   /  \    /  \ ____\_ |__   \_   ___ \|  |__   ____   ____ |  | __ ___________         "$blue"#";
    echo -e "#"$none"   \   \/\/   // __ \| __ \  /    \  \/|  |  \_/ __ \_/ ___\|  |/ // __ \_  __ \        "$blue"#";
    echo -e "#"$none"    \        /\  ___/| \_\ \ \     \___|   Y  \  ___/\  \___|    <\  ___/|  | \/        "$blue"#";
    echo -e "#"$none"     \__/\  /  \___  >___  /  \______  /___|  /\___  >\___  >__|_ \\___  >__|            "$blue"#";
    echo -e "#"$none"          \/       \/    \/          \/     \/     \/     \/     \/    \/               "$blue"#";
    echo -e $blue"##########################################################################################";
}
function menu()
{
    OIFS=$IFS; IFS=$'\n';$REPLY;IFS=$OIFS;
    echo -e "$red                                    :: MAIN MENU ::$none"
    a1=$(echo -e $blue"check sites config.txt"$none)
    a2=$(echo -e $blue"Enter a site"$none)
    a3=$(echo -e $blue"Quittez (q,Q)"$none)
    PS3="---> select an option : "
echo "------------------------------------------------------------------------------------------"
    select things in "$a1" "$a2" "$a3" ;do
        case $REPLY in
            1) option1
               break;;

            2) Enter
               break ;;

            3|Q*|q*) echo -e "$blue Bye ! $none"
               break;;

            *) echo -e "$blue You choice is not available ,$none  $red you must learn to read ^.^ $none";;
         esac
     done
}
function check()
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

function Enter()
{
    echo -e $green Enter a site : "(example:www.google.fr)"$none
    read type
    result=$(curl -Is $type  | head -n 1 | cut -d ' ' -f 2)

        if [ "$result" == "200" ]; then
            echo -e "$green functional site ! $none"
        else
            echo -e "$red $type Down !! $none"
            down+=($type)
        fi

}

function send_mail()
{
    emails=$(cat emails.txt)
    for liste in $emails; do
        echo "$down :$DATE" | mail -s "Website Down !" $liste
    done
}

function plop(){
    robot=$(cat dessin)
    if [ $down="`echo $var | grep motif`" ];then
        echo -e "$blue Sending down site , wait please ... $none"
        tput blink; echo "$robot"; tput sgr0
        send_mail
    else
        exit 0
    fi
}

function option1
{
    check
    plop
}
welcome
menu
