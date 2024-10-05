#!/bin/bash
echo "Script Punto E"

# Definir la ruta del directorio
DIR=~/repogit/UTNFRA_SO_1P2C_2024_Eduards/RTA_ARCHIVOS_Examen_20241003


# Asegurarte de que el directorio existe
mkdir -p "$DIR"

# Filtrar información de la RAM y guardar en el archivo
grep MemTotal /proc/meminfo > "$DIR/Filtro_Basico.txt"

# Filtrar información del fabricante del chasis y agregar al archivo
sudo dmidecode -t chassis | grep -i 'manufacturer' >> "$DIR/Filtro_Basico.txt"

