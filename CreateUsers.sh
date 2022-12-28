#!/bin/bash

cat users.csv | while read line
do 
	utilisateur=$(echo $line | cut -f1 -d",")
	nom=$(echo $line | cut -f2 -d",")
	passwd=$(echo $line | cut -f3 -d",")
    	passwrdCrypt=$(python3 -c 'import crypt; print(crypt.crypt("testpw", crypt.mksalt ( crypt.METHOD_SHA512)))')
    	newPATH="/opt/*/bin":$PATH
	sudo useradd -m -c "$nom" -p "$passwrdCrypt" "$utilisateur"
	
	if [ -e "/home/$( echo utilisateur)/.bash_profile" ]; then
		mv "/home/$utilisateur/.bash_profile" "/home/$utilisateur/.bash_profile.bak"
	fi
	touch "/home/$( echo utilisateur)/.bash_profile"
	echo "export PS1=\"\h@ \u [\w]\"" >> "/home/$( echo utilisateur)/.bash_profile"
	echo "alias rm=\"rm -i\"" >> "/home/$( echo utilisateur)/.bash_profile"
	echo "alias cp=\"cp -i\"" >> "/home/$( echo utilisateur)/.bash_profile"
	echo "alias mv=\"mv -i"\" >> "/home/$( echo utilisateur)/.bash_profile" 
	echo "export PATH=\"$( echo $newPath )\"" >> "/home/$( echo $username)/.bash_profile"
done

