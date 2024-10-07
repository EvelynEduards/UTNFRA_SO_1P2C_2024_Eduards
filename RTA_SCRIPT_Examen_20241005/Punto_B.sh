#!/bin/bash

DISCO="/dev/sdc"               # Disco de 10GB 
NUM_PARTICIONES=10             # Número de particiones a crear

# Crear las particiones usando parted
echo "Creando particiones primarias de 1 GiB..."
parted -s $DISCO mkpart primary 0% 1GiB
parted -s $DISCO mkpart primary 1GiB 2GiB
parted -s $DISCO mkpart primary 2GiB 3GiB

# Crear la partición extendida de 7 GiB
echo "Creando partición extendida de 7 GiB..."
parted -s $DISCO mkpart extended 3GiB 10GiB

# Crear las particiones lógicas de 1 GiB dentro de la partición extendida
echo "Creando particiones lógicas dentro de la partición extendida..."
parted -s $DISCO mkpart logical 3GiB 4GiB
parted -s $DISCO mkpart logical 4GiB 5GiB
parted -s $DISCO mkpart logical 5GiB 6GiB
parted -s $DISCO mkpart logical 6GiB 7GiB
parted -s $DISCO mkpart logical 7GiB 8GiB
parted -s $DISCO mkpart logical 8GiB 9GiB
parted -s $DISCO mkpart logical 9GiB 10GiB

echo "Las particiones han sido creadas."

# Formatear cada partición en ext4
for i in $(seq 1 $NUM_PARTICIONES); do
    sudo mkfs.ext4 "${DISCO}${i}"
    echo "Partición ${DISCO}${i} formateada en ext4."
done

# Crear las carpetas donde se montarán las particiones
sudo mkdir -p /Examenes-UTN/alumno_1/parcial_{1..3}
sudo mkdir -p /Examenes-UTN/alumno_2/parcial_{1..3}
sudo mkdir -p /Examenes-UTN/alumno_3/parcial_{1..3}
sudo mkdir -p /Examenes-UTN/profesores

echo "Montando las particiones..."
sudo mount /dev/sdc1 /Examenes-UTN/alumno_1/parcial_1
sudo mount /dev/sdc2 /Examenes-UTN/alumno_1/parcial_2
sudo mount /dev/sdc3 /Examenes-UTN/alumno_1/parcial_3
sudo mount /dev/sdc4 /Examenes-UTN/alumno_2/parcial_1
sudo mount /dev/sdc5 /Examenes-UTN/alumno_2/parcial_2
sudo mount /dev/sdc6 /Examenes-UTN/alumno_2/parcial_3
sudo mount /dev/sdc7 /Examenes-UTN/alumno_3/parcial_1
sudo mount /dev/sdc8 /Examenes-UTN/alumno_3/parcial_2
sudo mount /dev/sdc9 /Examenes-UTN/alumno_3/parcial_3
sudo mount /dev/sdc10 /Examenes-UTN/profesores

# Agregar entradas a /etc/fstab para el montaje persistente
{
    echo "/dev/sdc1   /Examenes-UTN/alumno_1/parcial_1   ext4    defaults    0    2"
    echo "/dev/sdc2   /Examenes-UTN/alumno_1/parcial_2   ext4    defaults    0    2"
    echo "/dev/sdc3   /Examenes-UTN/alumno_1/parcial_3   ext4    defaults    0    2"
    echo "/dev/sdc4   /Examenes-UTN/alumno_2/parcial_1   ext4    defaults    0    2"
    echo "/dev/sdc5   /Examenes-UTN/alumno_2/parcial_2   ext4    defaults    0    2"
    echo "/dev/sdc6   /Examenes-UTN/alumno_2/parcial_3   ext4    defaults    0    2"
    echo "/dev/sdc7   /Examenes-UTN/alumno_3/parcial_1   ext4    defaults    0    2"
    echo "/dev/sdc8   /Examenes-UTN/alumno_3/parcial_2   ext4    defaults    0    2"
    echo "/dev/sdc9   /Examenes-UTN/alumno_3/parcial_3   ext4    defaults    0    2"
    echo "/dev/sdc10  /Examenes-UTN/profesores            ext4    defaults    0    2"
} | sudo tee -a /etc/fstab

