FROM archlinux

# Mise à jour des dépots pacman

RUN pacman-key --init

RUN pacman -Syu --noconfirm

# Installation de nginx (sans galère, bizarre)

RUN pacman -S nginx openssl --noconfirm

# Copie du fichier de conf pour changer le root et le servername puis d'un fichier html

COPY nginx.conf /etc/nginx/

RUN mkdir /var/www/ && mkdir /var/www/html

COPY index.html /var/www/html/

RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/cert.key -out /etc/ssl/cert.pem -sha256 -days 3650 -nodes -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"

# Lancement de nginx

CMD ["nginx","-g", "daemon off;"]
