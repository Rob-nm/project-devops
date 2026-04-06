#!/bin/bash

# Cargar variables de configuración (Parte 7)
if [ -f config/config.env ]; then
    source config/config.env
else
    echo "❌ Error: Archivo config/config.env no encontrado."
    exit 1
fi

# Parámetros (si se pasan por terminal, sobrescriben al .env)
ACCION=${1:-"listar"}
ID_INSTANCIA=${2:-$INSTANCE_ID}
DIR_BACKUP=${3:-$DIRECTORY}
BUCKET=${4:-$BUCKET_NAME}

echo "--- 🚀 Iniciando Orquestación (Config Cargada) ---"
echo "Usando Bucket: $BUCKET"

# 1. Gestión EC2
python3 ec2/gestionar_ec2.py $ACCION $ID_INSTANCIA

# 2. Respaldo S3
bash s3/backup_s3.sh $DIR_BACKUP $BUCKET

echo "--- ✅ Proceso Finalizado ---"
