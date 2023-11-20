

FROM archlinux

RUN useradd dev -m 

RUN pacman-key --init

RUN pacman -Syu --noconfirm


RUN pacman -S base-devel git mariadb-libs postgresql-libs hiredis libsodium --noconfirm

RUN git clone https://aur.archlinux.org/proftpd.git /home/dev

RUN su dev

RUN cd proftpd

RUN makepkg

RUN exit

RUN cd /home/dev/proftpd

RUN pacman -U proftpd-2\:1.3.8a-1-x86_64.pkg.tar.zst --noconfirm 

#RUN pacman -S proftpd --noconfirm

#RUN systemctl start proftpd
