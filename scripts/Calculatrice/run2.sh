#!/bin/ba sh

function saisie() {                                                  # Fonction qui demande un calcul a l'utilisateur et verifie
                                                                     # le nombre de caractère .
echo "Veuillez entrer un calcul (123 + 123):"
read calcul
set $calcul
params=$#
}

function si_erreur() {                                               # Fonction qui après avoir vu une erreur demande une saisie

while [ "$params" != "3" ];do
                                                                 # guidée par le script .
    echo "Erreur veuillez suivre les instructions"

    echo "Veuillez entrer le premier caractère de l'operation :"
    read premier

    echo "Veuillez saisir le type d'opération"
    read operateur

    echo "Veuillez entrer le deuxième caractère de l'operation :"
    read deuxieme

    set $premier $operateur $deuxieme
    params=$#

   condition

done
}

function condition() {                                              # Condition qui affirme si la saisie est bonne ou renvoie
                                                                    # l'utilisateur a la fonction si_erreur .
if [ "$params" == "3" ];then
    echo "Good"
else
    si_erreur
fi

}

                                                                   #appel aux fonctions .
saisie

condition
