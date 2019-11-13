#!/bin/bash
# 1-Assegurate de que l'script se ejecuta con privilegios de superusuario.
if [[ "${UID}" -eq 0 ]]
then
  echo 'Eres root'
else
  echo 'No eres root.'
  exit 1
fi
# 2-Obtener el nombre de usuario (login).
echo "Introduza su nombre de usuario: "
read nombre
# 3-Obtener el nombre real (contindos para el campo de descripción).
echo "Introduzca su nombre real: "
read nomreal
# 4-Obtener la contraseña.
echo "Introduzca la contraseña: "
read -s password
# 5-Crear el usuario.
useradd -c "${nomreal}" -m ${nombre}
# 6-Comprovar si el comando "useradd" se ha producido correctamente.
if [ $? -eq 0 ]
then
  echo "Se ha creado correctamente"
else
  echo "No se ha podido crear"
  exit 1
fi
# 7-Cambiar la contraseña.
echo ${nombre}":"${password} | chpasswd
# 8-Comprovar si el comando "passwd" se ha producido correctamente.
if [ $? -eq 0 ]
then
  echo "Se ha asignado correctamente"
else
  echo "No se ha podido asignar"
  exit 1
fi
# 9-Forzar el cambio de contraseña en el primer login.
echo "Es obligado cambiar la contraseña la primera vez que entras con este usuraio"
read -s password2
echo ${nombre}":"${password2} | chpasswd
echo ${password2} | passwd ${nombre}
# 10-Mostrar el nombre de usuario, la contraseña y el host donde se ha creado el usuario.
echo "Tu nombre de usuario es: ${nombre}, tu contraseña es: ${password2} y el host desde el que lo has creado es: ${HOSTNAME}"
