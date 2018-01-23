#!/bin/bash
echo "tapez l'addresse absolue du dossier (exemple: /home/samuel/Bash/repo) :" && read chemin 
liste=$(ls $chemin)

nb=$(ls | wc -l) #compte le nombre de fichier a partir du ls
echo "$nb fichier trouver..."
echo "les voici : "
for file in $liste; do # pour les fichier dans la liste afficher  pour chacun des ficher leurs contenu .
    contenu=$(cat $chemin/$file)
    echo "$file et voici son contenu : $contenu"
done   
