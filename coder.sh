#!/bin/bash


MES="01"
HORA="10"
MINUTOS="00"
ANIO="2025"

# Loop del día, del 01 al 30
for DIA in {01..30}; do
  # Formatea la fecha en el formato mmddHHMMyyyy
  FECHA="${MES}${DIA}${HORA}${MINUTOS}${ANIO}"

  # Cambia la fecha del sistema (requiere permisos de administrador)
  echo "Cambiando la fecha a: $FECHA"
  sudo date "$FECHA"
  touch "$FECHA".txt
  echo "Hello!" > "$FECHA".txt
  git add "$FECHA".txt
  git commit -m "This is a commit"
  rm "$FECHA".txt

  # Espera 1 segundo entre cada cambio (opcional)
  sleep 1
done

sudo ntpdate -u time.apple.com

