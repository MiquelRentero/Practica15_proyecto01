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
# 10-Mostrar el nombre de usuario, la contraseña y el host donde se ha creado el usuario.
echo "Tu nombre de usuario es: ${nombre}, tu contraseña es: ${password2} y el host desde el que lo has creado es: ${HOSTNAME}"
