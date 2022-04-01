#!/bin/bash
clear
if [ "$(id -u)" != "0" ]; then
	echo "Per a executar l'script necessites privilegis root"
	exit 1
fi

echo "Descarregant el fitxer usuaris.ods ..."
wget http://www.collados.org/asix2/m06/uf2/usuaris.ods > /dev/null 2>&1

if [[ -e usuaris.ods ]]
then
	echo "S'ha descarregat el fitxer amb èxit"
else
	echo "El fitxer no s'ha pogut descarregar correctament"
	exit 2
fi

echo "Convertint el fitxer ods a csv ..."
libreoffice --convert-to csv --outdir . usuaris.ods  > /dev/null 2>&1

if [[ -e usuaris.csv ]]
then
	echo "Fitxer correctament convertit a csv"
else
	echo "El fitxer no s'ha pogut convertir correctament"
	echo "Exit..."
	exit 2
fi

uid=$((3001))
echo "***************"
while read line
do

	username=$(echo $line | cut -d ',' -f2)

	echo $username
	echo $uid
	useradd  $username  -u  $uid  -g  users  -d  /home/$username  -m  -s  /bin/bash  -p  $(mkpasswd  fjeclot) > /dev/null 2>&1
	if id "$username" &>/dev/null; then
		echo 'USER CREATED'
		echo "***************"
	else
		echo 'USER NOT CREATED'
		echo "***************"
		exit 3
	fi
	((uid=uid+1))
done < usuaris.csv

exit 0
