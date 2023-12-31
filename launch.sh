#!/bin/bash

# On doit exécuter ce script avec sudo

if [ $USER != root ];then
	echo "Vous devez exécuter ce script avec les privilèges root."
	exit 1	
fi	

if [ -z $1 ];then
	echo "il faut mettre votre clé publique en argument"
	exit
fi

# Si le fichier de partage n'existe pas, on doit le créer 

if [ -z /var/partage-docker ];then
	
	mkdir /var/partage-docker
fi

chown $SUDO_USER: /var/partage-docker

ssh-keygen -e -f $1 | grep -v "omment" > docker_proftpd/id_rsa.pub

# On construit les images à partir des Dockerfiles correspondants

docker build -t my_proftpd docker_proftpd/ 
docker build -t my_nginx docker_nginx/

# On supprime les conteneurs existants pour éviter les conflits

docker ps -aq | xargs docker rm -f

# On crée les conteneurs en les liants par le dossier /var/partage. On redirige les ports du localhost vers les ports du réseau virtuel

docker run -v /var/partage-docker:/home/dev -p 2222:2222 -d --name proftpd my_proftpd
docker run -v /var/partage-docker:/var/www/html -p 443:443 -d --name nginx my_nginx
