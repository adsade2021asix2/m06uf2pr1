#!/bin/bash

echo "Introdueix el directori d'origen: "
read dir1

tar -cvf $dir1.tar $dir1

echo "Introdueix el destí de l'arxiu: "
read dir2

cp -rf $dir1.tar $dir2

exit 1
