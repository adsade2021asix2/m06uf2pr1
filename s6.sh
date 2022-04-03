#!/bin/bash

local fitxer

echo "Introdueix el directori d'origen: "
read dir1

for fitxer in $1/*
do
	if [[ -s $fitxer ]] && [[ -x $fitxer ]]
	then
		tar -cvf $dir1.tar $dir1
	fi
done
#tar -cvf $dir1.tar $dir1

echo "Introdueix el destí de l'arxiu: "
read dir2

cp -rf $dir1.tar $dir2

exit 1
