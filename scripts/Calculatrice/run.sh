#!/bin/bash

green="\033[32;40m"
red="\033[31;40m"
none="\033[0m"
blue="\033[36;40m"
yellow="Default \e[93mLightyellow"

function welcome()
{
clear
echo -e "|--------------------------------|:::\e[5m"$green"C"$red"A"$green"L"$red"C"$green"U"$red"L"$green"A"$red"T"$green"O"$red"R"$none"\e[25m:::|-------------------------------|"
echo " "
echo " ___________________________________________________________________________________ "
echo "|-------------------------------|multiplication = * |-------------------------------|"
echo "|-------------------------------|division       = / |-------------------------------|"
echo "|-------------------------------|soustraction   = - |-------------------------------|"
echo "|-------------------------------|addition       = + |-------------------------------|"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
echo " "
}

function saisie() {                                                  # Fonction qui demande un calcul a l'utilisateur et verifie
    params=0
    CALCUL=0                                                                     # le nombre de caractère .
    read -p "Veuillez entrer un calcul (123 + 123): " CALCUL
    set $CALCUL
    params=$#
    a=$1
    b=$2
    c=$3
   condition
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
        echo -e "Votre resultat" $green "$premier $operateur $deuxieme =                 "$(($premier $operateur $deuxieme))$none
        demande
    done
}

function condition() {                                              # Condition qui affirme si la saisie est bonne ou renvoie
                                                                    # l'utilisateur a la fonction si_erreur .
    if [ "$params" == "3" ];then
        echo -e  "              " $green "                    $a $b $c =               "  $(($a $b $c)) $none
    else
        si_erreur
    fi
}

function demande() {
    echo "Souhaitez-vous refaire un calcul ? [y/n] "
    read reponse

    if [ "$reponse" == "y" ];then

        while [ "$reponse" == "y" ]; do
                clear
                welcome
                saisie
                echo "Souhaitez-vous refaire un calcul ? [y/n] "
                read reponse
        done

     else
        echo " Au revoir |°_^| ! "
     fi
}
welcome
saisie                                                                          #appel aux fonctions


