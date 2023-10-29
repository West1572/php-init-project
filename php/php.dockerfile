FROM php:8.2-fpm

# Install xdebug
RUN pecl install xdebug-3.2.2  \
    && docker-php-ext-enable xdebug

RUN docker-php-ext-install mysqli pdo pdo_mysql  \
    && docker-php-ext-enable pdo_mysql

# xdebug cannot write to it's log \
# устраянет ошибку NOTICE: PHP message: Xdebug: [Log Files] File '/var/log/xdebug.log' could not be opened.
RUN touch /var/log/xdebug.log \
    && chown root:root /var/log/xdebug.log \
    && chmod +x /var/log/xdebug.log
