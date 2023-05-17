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

RUN apt-get install -y php5.6 \
    php5.6-gd \
    php5.6-cli \
    php5.6-json \
    php5.6-curl \
    php5.6-pgsql \
    php-apcu \
    php5.6-fpm \
    imagemagick \
    libmagickcore-dev \
    libmagickwand-dev \
    php5.6-imagick


RUN echo "[apcu]" >> /etc/php/5.6/apache2/php.ini &&\
    echo "extension=apcu.so" >> /etc/php/5.6/apache2/php.ini &&\
    echo "apc.enabled=1" >> /etc/php/5.6/apache2/php.ini

# RUN apt-get install -y nginx

# RUN curl -sS https://getcomposer.org/installer | php
# RUN mv composer.phar /usr/local/bin/composer.phar

# RUN apt-get install -y zip
# RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10
# RUN npm install -g uglify-js2 uglifycss autoprefixer
# RUN update-alternatives --install /usr/bin/uglifyjs uglifyjs /usr/bin/uglifyjs2 10

# TODO erro ao usar o gem install
# ERROR:  While executing gem ... (NameError)
#     uninitialized constant Gem::SafeYAML 
# RUN gem install sass -v 3.4.22 --no-document

# RUN mkdir /app \
#     cd /app \
#     git clone https://github.com/hacklabr/mapasculturais.git