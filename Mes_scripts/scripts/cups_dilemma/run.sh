#!/bin/bash

chemin=$(echo $PWD"/repo")
liste=$(ls $chemin)

function get_name_nbr()  #fonction qui sert a avoir le nombre du fichier .
{
    filef=$1
    result=$(ls $chemin/$filef | cut -d "_" -f 2 | cut -d "." -f 1)
    echo $result
}

function get_content_nbr()  #fonction qui sert a prendre le contenu d'un fichier 
{
    filec=$1
    result=$(cat $chemin/$filec | cut -d " " -f 4)
    echo $result
}

function find_right_file() #trouver le bon fichier .
{
    nbr=$1
    for rfile in $(ls $chemin); do
        content=$(get_content_nbr $rfile)
        if [ "$nbr" == "$content" ]; then
             echo $rfile
        fi
    done
}

for file in $liste; do 
    echo "processing file : $file"
    numerof=$(get_name_nbr $file)
    numeroc=$(get_content_nbr $file)
    if [ "numerof" != "numeroc" ]; then
        right_one=$(find_right_file $numerof)
        echo "Right one is : $right_one"
        tmp=$(cat $chemin/$file)
        right_content=$(cat $chemin/$right_one)
        
        echo $right_content > $chemin/$file
        echo $tmp > $chemin/$right_one
    fi
done

