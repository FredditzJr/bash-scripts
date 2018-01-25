#!/bin/bash

echo $0 
echo $1
echo $2
echo $3

exit 0

OIFS=$IFS; IFS=$'\n';scripts=($(ls "scripts/"));IFS=$OIFS;
COLUMNS=12
scripts+=("Quit")
echo "veuillez choisir un script à executer ci : "
select script in "${scripts[@]}"; do
    case $script in
         "Quit") echo "Bye"; exit 0;;
	 *) bash scripts/$script/run.sh ;;
     esac
done

