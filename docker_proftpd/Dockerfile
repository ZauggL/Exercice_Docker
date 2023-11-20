

FROM archlinux

COPY mdp /

COPY proftpd-2\:1.3.8a-1-x86_64.pkg.tar.zst /

RUN useradd dev -m 

RUN passwd dev < mdp

#RUN pacman-key --init

RUN pacman -Syu --noconfirm


#RUN pacman -S base-devel git mariadb-libs postgresql-libs hiredis libsodium --noconfirm

#RUN git clone https://aur.archlinux.org/proftpd.git /home/dev/proftpd

#RUN ls -l /home/dev/proftpd 

#RUN chown -R dev: /home/dev

#USER dev

#WORKDIR /home/dev/proftpd
#RUN whoami

#ENV BUILDDIR /home/dev/proftpd
#ENV PKGDEST /home/dev/proftpd
#ENV SRCDEST /home/dev/proftpd
#RUN makepkg -s

#USER root
#RUN exit

#RUN cd /home/dev/proftpd

RUN pacman -U proftpd-2\:1.3.8a-1-x86_64.pkg.tar.zst --noconfirm 

#RUN pacman -S proftpd --noconfirm

CMD ["proftpd","--nodaemon"]
