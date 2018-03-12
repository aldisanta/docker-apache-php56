FROM aldisanta/docker-jessie-apache
LABEL maintainer="Aldi Dipasanta"

RUN apt-get update \
    && apt-get -y install curl php5 php5-mysql php5-curl php5-json php5-mcrypt \
    && apt-get -y install libapache2-mod-php5 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN service apache2 restart

RUN /usr/sbin/a2dismod 'mpm_*' && /usr/sbin/a2enmod mpm_prefork

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
