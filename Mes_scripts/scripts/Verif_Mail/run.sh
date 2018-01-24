#!/bin/bash

function valid_email {
    mail=$1 #Premier parametre de la fonction .
    if echo "${mail}" | grep '^[a-zA-Z0-9]*@[a-zA-Z0-9]*\.[a-zA-Z0-9]*$' >/dev/null; then
        echo "1"
    else
        echo "0"
    fi
}


valid="0"
while [ "$valid" == "0" ]; do # tant que Le programme qui verifie la validation de l'email repond est egal a 0 continuer a demander une addresse valide . 
    echo "veuillez entree une addresse mail valide :"
    read email
    valid=$(valid_email $email) # $email est le premier parametre en question.
done
