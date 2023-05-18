#FROM ubuntu:14.04
FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y git curl npm 
# RUN apt-get install -y ruby2.0 ruby2.0-dev
RUN apt-get install -y ruby-full

RUN update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby2.5 10
RUN update-alternatives --install /usr/bin/gem gem /usr/bin/gem2.5 10

#RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
RUN apt-get install -y sudo
RUN apt-get install -y nodejs

# TODO ver como instalar o postgresql e o postgis
# RUN apt-get install -y postgresql \
#     postgresql-contrib \
#     postgis
#     postgresql-9.3-postgis-2.1 \
#     postgresql-9.3-postgis-2.1-scripts

#RUN /etc/init.d/postgresql start

RUN ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/timezone
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN sudo apt-get install software-properties-common -y
RUN sudo add-apt-repository -y ppa:ondrej/php

RUN echo 'deb http://archive.ubuntu.com/ubuntu focal main universe multiverse restricted' >> /etc/apt/sources.list
RUN echo 'deb http://security.ubuntu.com/ubuntu/ focal-security main multiverse universe restricted' >> /etc/apt/sources.list
RUN echo 'deb http://archive.ubuntu.com/ubuntu focal-updates main multiverse universe restricted' >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y php5.6 \
    php5.6-gd \
    php5.6-cli \
    php5.6-json \
    php5.6-curl \
    php5.6-pgsql \
    php-apcu \
    php5.6-fpm

RUN apt-get install -y imagemagick \
    libmagickcore-dev \
    libmagickwand-dev \
    php5.6-imagick

RUN echo "[apcu]" >> /etc/php/5.6/fpm/php.ini &&\
    echo "extension=apcu.so" >> /etc/php/5.6/fpm/php.ini &&\
    echo "apc.enabled=1" >> /etc/php/5.6/fpm/php.ini

RUN apt-get install -y nginx

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer.phar

RUN apt-get install -y zip
RUN apt-get install -y apt-utils
RUN apt-get install -y npm --fix-missing

#RUN sudo update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10
RUN npm install -g uglify-js2 uglifycss autoprefixer
RUN update-alternatives --install /usr/bin/uglifyjs uglifyjs /usr/local/bin/uglifyjs2 10

# TODO erro ao usar o gem install
# ERROR:  While executing gem ... (NameError)
#     uninitialized constant Gem::SafeYAML 
RUN gem install sass -v 3.4.22 --no-document

RUN mkdir /app && \
    cd /app && \
    git clone https://github.com/hacklabr/mapasculturais.git

# RUN apt-get install -y postgresql \
#     postgresql-contrib \
#     postgis

# RUN apt-get install -y postgresql-9.3-postgis-2.1 \
#     postgresql-9.3-postgis-2.1-scripts

# RUN /etc/init.d/postgresql start

# RUN sudo apt -y install gnupg2 wget
# RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
# RUN sudo apt-get -y install gpg apt-transport-https lsb-release ca-certificates
# RUN curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg
# RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
# RUN sudo apt-get update
# RUN sudo apt-get install -y gdal-data -f
# RUN sudo apt-get install -y libgdal-dev -f
# RUN sudo apt install -y postgresql-13 postgresql-client-13
# RUN sudo apt install -y postgis postgresql-13-postgis-3