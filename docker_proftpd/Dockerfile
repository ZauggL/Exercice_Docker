FROM archlinux 

# Il faut un mot de passe à l'utilisateur dev

COPY mdp /

# Plutôt que d'installer proftpd pendant le build, on le fait une fois pour toute et on copie l'archive dans le dossier git

COPY proftpd-2\:1.3.8a-1-x86_64.pkg.tar.zst /

RUN useradd dev -m 

# Le mot de passe de dev doit être écrit deux fois dans le fichier mdp pour la confirmation

RUN passwd dev < mdp

# Mise à jour des dépots pacman

RUN pacman-key --init

RUN pacman -Syu --noconfirm

# Installation de proftpd à partir de l'archive que l'on a créé en amont

RUN pacman -U proftpd-2\:1.3.8a-1-x86_64.pkg.tar.zst --noconfirm 

# Systemctl n'est pas utilisable ici, on doit utiliser cette commande à la place

CMD ["proftpd","--nodaemon"]
