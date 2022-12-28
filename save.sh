#!/bin/bash
case $2 in 
    *.tar )
        tar -cf $2 $1 ;;
    * )
        if [ ! -d  $2 ]
        then
            mkdir $2
        fi
        if [ -d $1 ]
        then
            rsync -a $1 $2
        else
            echo "Le 1er paramètre n'est pas un répertoire"
        fi
esac

