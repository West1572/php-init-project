FROM nginx:1.25.2-alpine

#Добавляем если нет в докер-копоуз
#но лучше указывать директиву в копоузе
#ADD /nginx/default.conf /etc/nginx/conf.d/default.conf

#RUN mkdir -p /var/www/html
