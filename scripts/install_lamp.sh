#!/bin/bash

#-e:Finaliza el script cuando hay un error
#-x: Muestra el comando por pantalla
set -x

#Actualiza los repositorios
apt update

#Actualizamos los paquetes 
apt upgrade -y

#Instalamos el servidor web apache
apt install apache2 -y

#Instalamos PHP
p-mysql -apt install php libapache2-mod-php phy

#Copiamos el archivo de configuración de Apache
cp ../conf/000-default.conf /etc/apache2/sites-available/000-default.conf

#Reiniciar el servicio de Apache
systemctl restart apache2

#Copiamos nuestro archivo de prueba de PHP 
cp ../php/index.php /var/www/html

#María del Mar López Montoya 2º DAW