FROM ubuntu:14.04
MAINTAINER Daniel Guerra
RUN apt-get -yy update
RUN apt-get -yy install wget libx11-6 libx11-xcb1 libfontconfig1 supervisor xvfb x11vnc
WORKDIR /tmp
RUN wget http://www.soulseekqt.net/SoulseekQT/Linux/SoulseekQt-2015-6-25-64bit.tgz
RUN tar xvfz SoulseekQt-2015-6-25-64bit.tgz
RUN mv SoulseekQt-2015-6-25-64bit /usr/bin/SoulseekQt
RUN addgroup soulseek
RUN useradd -m -g soulseek soulseek
EXPOSE 5900
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
