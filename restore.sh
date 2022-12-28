#!/bin/bash

case $1 in
    *.tar )
        if [ ! -d $2 ]
        then 
            mkdir $2
        fi
        tar -xf $1 -C $2 ;;
    *)
        if [ ! -d $2 ]
        then
            mkdir $2
        fi 
        if [ ! -d $1 ]
        then
            rsync -a $1 $2 
        else
            echo "Le premier parametre n'est pas un repertoir"
        fi
esac 

