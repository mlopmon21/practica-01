# Práctica 1

## Configuración manual de la pila LAMP
En esta guía se describe, paso a paso, cómo instalar y configurar la pila LAMP en Debian/Ubuntu. Incluye con detalle las medidas de seguridad de seguridad que requieren interacción(especialmente en MySQL) y ofrece comandos ajustados e estos sistemas.

## Requisitos Previos
- Un sistema operativo Linux (en este caso Ubuntu).
- Acceso a internet para descargar paquetes.
- Un usuario con permisos de sudo.

## Instalación Paso a Paso

### PASO 1
Colocamos al principio del script de shell esta línea. La cual le indica al sistema operativo qué intérprete debe utilizar para ejecutar el archivo.

En este caso, le dice al sistema que use el programa Bash (Bourne Again SHell), que se encuentra en /bin/bash, para procesar los comandos siguientes.

```
#!/bin/bash 
```

### PASO 2
Activamos el modo depuración con el siguiente comando. Con ello conseguimos que cada comando se muestre en la terminal (precedido por +) justo antes de ejecutarse, lo cual es muy importante para seguir el flujo de trabajo y depurar.

```
set -x 
```
```
-e: Finaliza el script cuando hay un error
```
```
-x: Muestra el comando por pantalla
```
### PASO 3
Descargamos la lista más reciente de paquetes disponibles desde los repositorios configurados. Con esto no instalamos nada todavía.

```
sudo apt update
```
### PASO 4
Instalamos las actualizaciones disponibles para los paquetes ya instalados. Con -y acepta automáticamente las confirmaciones.

```
sudo upgrade -y
```
### PASO 5
Instalamos el servidor web Apache HTTP Server -y confirma la instalación sin preguntar.

```
sudo install apache2 -y
```
### PASO 6
Instalamos el intérprete de PHP (ejecuta código PHP en el sistema), con libapache2-mod-php (modulo que integra PHP con Apache para procesar archivos .php) y php-mysql (extensión de PHP para conectarse a bases de datos MySQL/MariaDB).

```
sudo apt install php libapache2-mod-php php-mysql -y
```
### PASO 7
Copiamos el archivo de configuración de Apache. Nos tenemos que asegurar de que usamos una ruta relativa como la del siguiente comando.

```
cp ../conf/000-default.conf /etc/apache2/sites-available/000-default.conf

```
### PASO 8
Reiniciamos el servicio de Apache para aplicar los cambios de configuración.

```
systemctl restart apache2
```
### PASO 9
Copiamos nuestro archivo de prueba PHP index.php al DocumentRoot por defecto (/var/www/html) para validar que PHP funciona.

```
cp ../php/index.php /var/www/html
```
### PASO 10 
Por último usamos el siguiente comando que instala y configura la pila LAMP (Linux + Apache + MySQL/MariaDB + PHP).  
```
sudo ./install_lamp.sh
```

![Imagen](practica1/img/imagenPhp.png)
## Ejecución
Abrimos una nueva terminar bash en el mismo intérprete, y ponemos el siguiente comando.

```
sudo bash ./provision.sh
```

## Verificación 
Abrimos el navegador ponemos la Dirección IPv4 pública de nuestra estancia con ``` http://Dirección IPv4 pública```. Y deberiamos ver la salida de index.php. En nuestro caso vemos la página de información php ya que nuestro archivo incluye phpinfo().  

![Imagen](practica1/img/imagenFinal.png)
  
    
##### María del Mar López Montoya | 2ºDAW


