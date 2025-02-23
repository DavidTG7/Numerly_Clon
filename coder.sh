#!/bin/bash

# Carpeta del repositorio
REPO_DIR="./"

# Fecha de inicio: 4 meses atrás
START_DATE=$(date -v-4m +"%Y-%m-%d")

# Fecha de fin: hoy
END_DATE=$(date +"%Y-%m-%d")

# Moverse al repositorio
cd "$REPO_DIR" || exit

# Loop por cada día entre la fecha de inicio y hoy
CURRENT_DATE="$START_DATE"
while [ "$CURRENT_DATE" != "$(date -j -f "%Y-%m-%d" "$END_DATE" +"%Y-%m-%d" -v+1d)" ]; do
  echo "Haciendo commit para: $CURRENT_DATE"

  # Crear o modificar un archivo de prueba
  echo "Commit del $CURRENT_DATE" > commit.txt

  # Añadir el archivo
  git add commit.txt

  # Crear commit con fecha específica
  GIT_COMMITTER_DATE="$CURRENT_DATE 12:00:00" GIT_AUTHOR_DATE="$CURRENT_DATE 12:00:00" git commit -m "Commit automático del $CURRENT_DATE"

  # Avanzar al siguiente día
  CURRENT_DATE=$(date -j -v+1d -f "%Y-%m-%d" "$CURRENT_DATE" +"%Y-%m-%d")
done

# Subir los cambios
git push origin main
