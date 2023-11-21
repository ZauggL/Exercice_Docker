FROM archlinux

# Mise à jour des dépots pacman

RUN pacman-key --init

RUN pacman -Syu --noconfirm

# Installation de nginx (sans galère, bizarre)

RUN pacman -S nginx --noconfirm

# Copie du fichier de conf pour changer le root et le servername puis d'un fichier html

COPY nginx.conf /etc/nginx/

RUN mkdir /var/www/ && mkdir /var/www/html

COPY index.html /var/www/html/

# Lancement de nginx

CMD ["nginx","-g", "daemon off;"]
