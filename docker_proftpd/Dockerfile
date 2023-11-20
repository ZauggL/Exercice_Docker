

FROM archlinux

RUN useradd dev -m 

RUN pacman-key --init

RUN pacman -Syu --noconfirm


RUN pacman -S base-devel git mariadb-libs postgresql-libs hiredis libsodium --noconfirm

RUN git clone https://aur.archlinux.org/proftpd.git /home/dev/proftpd

RUN chown -R dev: /home/dev

RUN ls -l /home/dev/proftpd

USER dev 


RUN cd /home/dev/proftpd

#RUN whoami

RUN makepkg

USER ROOT
#RUN exit

RUN cd /home/dev/proftpd

RUN pacman -U proftpd-2\:1.3.8a-1-x86_64.pkg.tar.zst --noconfirm 

RUN pacman -S proftpd --noconfirm

RUN systemctl start proftpd
