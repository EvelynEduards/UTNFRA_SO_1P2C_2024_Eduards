#!/bin/bash
# Script Punto F

# Definir el directorio donde se guardará el archivo
DIR=~/repogit/UTNFRA_SO_1P2C_2024_Eduards/RTA_ARCHIVOS_Examen_20241003

# Asegurarte de que el directorio existe
mkdir -p "$DIR"

# Obtener IP pública y guardar en el archivo
echo "Mi ip publica es: $(curl -s ifconfig.me)" > "$DIR/Filtro_Avanzado.txt"

# Obtener usuario actual y añadir al archivo
echo "Mi usuario es: $(whoami)" >> "$DIR/Filtro_Avanzado.txt"

# Obtener hash del usuario y añadir al archivo
echo "El hash de mi usuario es: $(sudo grep "^$(whoami):" /etc/shadow | awk -F: '{print $2}')" >> "$DIR/Filtro_Avanzado.txt"

# Obtener URL del repositorio y añadir al archivo
echo "La URL de mi repositorio es: $(git remote get-url origin)" >> "$DIR/Filtro_Avanzado.txt"

