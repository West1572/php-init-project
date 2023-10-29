#!/bin/bash

#Остановка сети
echo "Остановка запущенных контейнеров"
docker-compose down -v

# сборка проекта
echo "Сборка проекта"
docker-compose build --no-cache

# Запуск проекта
echo "Запуск проекта"
docker-compose up -d

# Вывод консоли
echo "Вывод консоли"
docker-compose logs -f

