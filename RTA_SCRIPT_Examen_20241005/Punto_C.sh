#!/bin/bash
echo "Script Punto C"

# Crear grupos
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

# Crear usuarios y asignar grupos
sudo useradd -m -s /bin/bash -c "alumno 1" -p "$(sudo grep osboxes /etc/shadow | awk -F ':' '{print $2}')" -G p1c2_2024_gAlumno p1c2_2024_A1
sudo useradd -m -s /bin/bash -c "alumno 2" -p "$(sudo grep osboxes /etc/shadow | awk -F ':' '{print $2}')" -G p1c2_2024_gAlumno p1c2_2024_A2
sudo useradd -m -s /bin/bash -c "alumno 3" -p "$(sudo grep osboxes /etc/shadow | awk -F ':' '{print $2}')" -G p1c2_2024_gAlumno p1c2_2024_A3
sudo useradd -m -s /bin/bash -c "profesor 1" -p "$(sudo grep osboxes /etc/shadow | awk -F ':' '{print $2}')" -G p1c2_2024_gProfesores p1c2_2024_P1


# Ajustar permisos de las carpetas
sudo chmod 740 /Examenes-UTN/alumno_1     # rwx r-x ---
sudo chmod 700 /Examenes-UTN/alumno_2     # rwx ---
sudo chmod 770 /Examenes-UTN/alumno_3     # rwx rwx ---
sudo chmod 770 /Examenes-UTN/profesores    # rwx rwx ---

# Cambiar dueño y grupo de las carpetas
sudo chown p1c2_2024_A1:p1c2_2024_gAlumno /Examenes-UTN/alumno_1
sudo chown p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chown p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo chown p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores



