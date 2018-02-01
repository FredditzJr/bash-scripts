#!/bin/bash

function valid_email() {
        mail=$1 #Premier parametre de la fonction .
        if echo "${mail}" | grep '^[a-zA-Z0-9]*@[a-zA-Z0-9]*\.[a-zA-Z0-9]*$' >/dev/null; then
            echo "1"
        else
            echo "0"
        fi
}

function Entrez(){
    valid="0"
    while [ "$valid" == "0" ]; do # tant que Le programme qui verifie la validation de l'email repond est egal a 0 continuer a demander une addresse valide . 
        echo "Please enter a valid email for your receiver :"
        read email
        valid=$(valid_email $email) # $email est le premier parametre en question.
    done
}

serveur=smtp.gmail.com
port=25

function package_exists()
{
    return which "$1" &> /dev/null
}

function smtp_send()
{
    echo "Mail envoyé le $(date)" | mail -s "Subject" $email
}

function send()
{
    info_send samuelrousselle0@gmail.com $email "Envoie test." "Je test mon programme Send_Mail" | telnet $serveur $port
}

function info_send()
{
    echo  EHLO $serveur
    sleep 1
    FROM="$1"
    sleep 1
    TO="$2"
    sleep 1
    SUBJECT="$3"
    sleep 1
    BODY="$4"
    sleep 1
    echo .
    echo quit
}

Entrez
quel=$(which sendmail)

if [ "$quel" == "/usr/bin/sendmail" ]; then
    send
else
    smtp_send
fi
