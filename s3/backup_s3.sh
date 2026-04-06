#!/bin/bash

# Configuración - ASEGÚRATE QUE EL NOMBRE DEL BUCKET COINCIDA CON EL QUE CREASTE
BUCKET="s3://backup-roberto-naredo-2026"
SOURCE_DIR="../ec2" 
BACKUP_NAME="backup_$(date +%Y%m%d_%H%M%S).tar.gz"
LOG_FILE="../logs/backup.log"

echo "[$(date)] Iniciando respaldo de $SOURCE_DIR..." >> $LOG_FILE

# 1. Comprimir la carpeta (feat: compresión de archivos)
tar -czf $BACKUP_NAME $SOURCE_DIR

# 2. Subir a S3 usando AWS CLI (feat: subida a S3)
aws s3 cp $BACKUP_NAME $BUCKET/

# 3. Registro de logs (feat: generación de logs)
if [ $? -eq 0 ]; then
    echo "[$(date)] Respaldo exitoso: $BACKUP_NAME" >> $LOG_FILE
    rm $BACKUP_NAME
else
    echo "[$(date)] ERROR en el respaldo" >> $LOG_FILE
fi
