FROM php:8.1-fpm

ARG USER_ID
ARG GROUP_ID

RUN apt-get update && apt-get install -y --no-install-recommends git zip \
    curl \
    wget \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev  \
    libpspell-dev \
    libedit-dev \
    libxml2-dev \
    libxslt-dev \
    libyaml-dev \
    libzip-dev \
    jq \
    zlib1g-dev  \
    libicu-dev

RUN docker-php-ext-install opcache \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install calendar \
    && docker-php-ext-install exif \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install pspell \
    && docker-php-ext-install shmop \
    && docker-php-ext-install soap \
    && docker-php-ext-install sockets \
    && docker-php-ext-install sysvmsg \
    && docker-php-ext-install sysvsem \
    && docker-php-ext-install sysvshm \
    && docker-php-ext-install xml \
    && docker-php-ext-install zip \
    && docker-php-ext-install gettext

RUN pecl install yaml && docker-php-ext-enable yaml

ARG INSTALL_XDEBUG=false
ARG XDEBUG_HOST=dockerhost
RUN if [ ${INSTALL_XDEBUG} = true ]; then \
    pecl install xdebug \
        && docker-php-ext-enable xdebug \
        && echo "zend_extension=xdebug" >> /usr/local/etc/php/conf.d/xdebug.ini \
        && echo "xdebug.client_host=${XDEBUG_HOST}" >> /usr/local/etc/php/conf.d/xdebug.ini \
        && echo "xdebug.client_port=9003" >> /usr/local/etc/php/conf.d/xdebug.ini \
        && echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/xdebug.ini \
        && echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/xdebug.ini \
;fi

ADD ./php.ini /usr/local/etc/php/php.ini

RUN wget https://getcomposer.org/installer -O - -q \
    | php -- --install-dir=/usr/local/bin --filename=composer --quiet

RUN usermod -u ${USER_ID} www-data && groupmod -g ${GROUP_ID} www-data

WORKDIR /var/www

USER "${USER_ID}:${GROUP_ID}"

CMD ["php-fpm"]
