#!/bin/bash

# x muestra los comandos que se realizan
# e en caso de fallar detiene la ejecucion
set -ex

source .env # Inportamos el contenido de variables de entorno

# Actualiza la lista de paquetes
apt update

# Actualizamos paquetes de sistema operativo
apt upgrade -y # -y respuesta yes

# Configuramos las respuestas para phpMyAdmin
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password $PHPMYADMIN_APP_PASSWORD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password $PHPMYADMIN_APP_PASSWORD" | debconf-set-selections

# Instalamos phpMyAdmin
sudo apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl -y