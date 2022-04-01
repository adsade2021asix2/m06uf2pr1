#!/bin/bash
clear

if [[ -e nousUsuaris.ldif ]]
then
    rm -R nousUsuaris.ldif
else
    echo "nousUsuaris.ldif"
fi

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

                    echo "dn: uid=usr$uidNumber,cn=UsuarisDomini,ou=UsuarisGrups,dc=fjeclot,dc=net" >> nousUsuaris.ldif
                    echo "objectClass: top" >> nousUsuaris.ldif
                    echo "objectClass: posixAccount" >> nousUsuaris.ldif
                    echo "objectClass: shadowAccount" >> nousUsuaris.ldif
                    echo "objectClass: person" >> nousUsuaris.ldif
                    echo "uid:usr$uidNumber" >> nousUsuaris.ldif
                    echo "gidNumber: 100" >> nousUsuaris.ldif
                    echo "loginShell: /bin/bash" >> nousUsuaris.ldif
                    echo "cn: usr$uidNumber usr$uidNumber" >> nousUsuaris.ldif
                    echo "sn: usr$uidNumber" >> nousUsuaris.ldif
                    echo "homeDirectory: /home/usr$uidNumber" >> nousUsuaris.ldif
                    echo "" >> nousUsuaris.ldif
                    echo "" >> nousUsuaris.ldif
                    ((uidNumber++))
                done
                #ldapadd -x -W -D "cn=UsuarisDomini,ou=UsuarisGrups,dc=fjeclot,dc=net" -f nousUsuaris.ldif

            break;
            fi

        done
    break;
    fi

done
exit 0
