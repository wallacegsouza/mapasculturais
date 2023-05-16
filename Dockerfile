#FROM ubuntu:14.04
FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y git curl npm 
RUN apt-get install -y ruby2.0 ruby2.0-dev

RUN update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby2.0 10
RUN update-alternatives --install /usr/bin/gem gem /usr/bin/gem2.0 10

RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

RUN apt-get install -y sudo
RUN apt-get install -y --force-yes nodejs

RUN apt-get install -y  postgresql \
    postgresql-contrib \
    postgis \
    postgresql-9.3-postgis-2.1 \ 
    postgresql-9.3-postgis-2.1-scripts

# RUN /etc/init.d/postgresql start

RUN apt-get install -y php5 \
    php5-gd \
    php5-cli \
    php5-json \
    php5-curl \
    php5-pgsql \
    php-apc \
    php5-fpm \
    imagemagick \
    libmagickcore-dev \
    libmagickwand-dev \
    php5-imagick

RUN apt-get install -y nginx

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer.phar

RUN apt-get install -y zip
RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10
RUN npm install -g uglify-js2 uglifycss autoprefixer
RUN update-alternatives --install /usr/bin/uglifyjs uglifyjs /usr/bin/uglifyjs2 10

# TODO erro ao usar o gem install
# ERROR:  While executing gem ... (NameError)
#     uninitialized constant Gem::SafeYAML 
# RUN gem install sass -v 3.4.22 --no-document

# RUN mkdir /app \
#     cd /app \
#     git clone https://github.com/hacklabr/mapasculturais.git