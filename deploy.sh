#!/bin/bash
# Ejemplo: ./deploy.sh iniciar i-123 ./ec2 mi-bucket
ACCION=$1
ID_INSTANCIA=$2
DIR_BACKUP=$3
BUCKET=$4

echo "--- Iniciando Orquestación ---"

# 1. Ejecutar script de Python
python3 ec2/gestionar_ec2.py $ACCION $ID_INSTANCIA

# 2. Ejecutar script de Bash para respaldo
bash s3/backup_s3.sh $DIR_BACKUP $BUCKET

echo "--- Proceso Finalizado ---"
