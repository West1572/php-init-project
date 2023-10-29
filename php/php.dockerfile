FROM php:8.2-fpm

# Установка дополнительных зависимостей
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip

# Установка Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# часть этого файла взята отсюда установка зависимостей компоузера сейчас не актуальна
#https://qaa-engineer.ru/doker-sostavlyaet-php-fpm-nginx-mysql-i-ispolzuet-wp-cli-na-nginx/
# Установка зависимостей проекта
#RUN composer install --no-scripts --no-autoloader

# Установка драйверов  mysql
RUN docker-php-ext-install mysqli pdo pdo_mysql  \
    && docker-php-ext-enable pdo_mysql


# Install xdebug
RUN pecl install xdebug-3.2.2  \
    && docker-php-ext-enable xdebug


# xdebug cannot write to it's log \
# устраянет ошибку NOTICE: PHP message: Xdebug: [Log Files] File '/var/log/xdebug.log' could not be opened.
RUN touch /var/log/xdebug.log \
    && chown root:root /var/log/xdebug.log \
    && chmod +x /var/log/xdebug.log
