#!/bin/bash
clear

while [[ true ]]
do
    echo "Numero d'usuaris totals (entre 1 i 100) "
    read Tusuarios
    if ((Tusuarios >=1 && Tusuarios <= 100))
    then
        while [[ true ]]
        do
            echo "Valor uid per usuaris (minim 5000) "
            read uidNumber
            if ((uidNumber >= 5000))
            then

               for (( contador=0; contador<Tusuarios; contador++ ))
                do
                    PASSWORD=$(echo $RANDOM$(date +%N%s) |md5sum |cut -c 2-9)
                    echo "usr$uidNumber:$PASSWORD" | chpasswd
                    echo "usr$uidNumber:$PASSWORD" >> ctsUsuaris.txt
                    echo "----------------------------------------" >> ctsUsuaris.txt
                    ((uidNumber++))
                done

            break;
            fi

        done
    break;
    fi

done
exit 0
