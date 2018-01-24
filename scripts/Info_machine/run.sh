#!/bin/bash
date=$(date +%Y%m%d"_"%H%M%S) #date  help-- pour plus d'option .
touch $USER"_"$date.txt
txt=($USER"_"$date.txt)
echo "Utilisateur : " $USER>$txt
echo "Chemin du home de l'utilisateur :" $HOME>>$txt
echo "l'OS et le type de machine :">>$txt
lsb_release  -i>>$txt
lsb_release  -r>>$txt
lsb_release  -c>>$txt
echo  "Version Bash :" $BASH_VERSION>>$txt
npr=$(nproc)>>$txt
ram=$(free -mh | grep Mem | cut -d " " -f 11)>>$txt
echo  "nombre de processeur :" $npr>>$txt
echo  "la Ram "  $ram>>$txt

