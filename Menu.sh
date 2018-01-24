#!/bin/bash
OIFS=$IFS; IFS=$'\n';scripts=($(ls "scripts/"));IFS=$OIFS;
scripts+=("Quit")
echo "veuillez choisir un script à executer ci : "
select script in "${scripts[@]}"; do
    case $script in
         "Quit") echo "Bye"; exit 0;;
	 *) bash scripts/$script/run.sh ;;
     esac
done

