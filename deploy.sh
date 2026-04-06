#!/bin/bash
# Uso: ./deploy.sh <accion> <id_instancia> <directorio> <bucket>

ACCION=$1
ID_INSTANCIA=$2
DIR_BACKUP=$3
BUCKET=$4

echo "--- 🚀 Iniciando Orquestación DevOps ---"

# Paso 1: Ejecutar script de Python (Gestión EC2)
echo "[1/2] Gestionando instancia EC2..."
python3 ec2/gestionar_ec2.py $ACCION $ID_INSTANCIA
if [ $? -ne 0 ]; then
    echo "❌ Error en el paso de EC2. Abortando."
    exit 1
fi

# Paso 2: Ejecutar script de Bash (Respaldo S3)
echo "[2/2] Iniciando respaldo en S3..."
bash s3/backup_s3.sh $DIR_BACKUP $BUCKET
if [ $? -ne 0 ]; then
    echo "❌ Error en el paso de S3."
    exit 1
fi

echo "--- ✅ Proceso Finalizado Exitosamente ---"
