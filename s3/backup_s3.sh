#!/bin/bash
# Parámetros: $1=Directorio, $2=Bucket
DIR=$1
BUCKET=$2
BACKUP_NAME="backup_$(date +%Y%m%d_%H%M%S).tar.gz"
LOG_FILE="../logs/backup.log"

if [ -z "$DIR" ] || [ -z "$BUCKET" ]; then
    echo "Uso: ./backup_s3.sh <directorio> <nombre-bucket>"
    exit 1
fi

echo "[$(date)] Iniciando respaldo de $DIR en $BUCKET" >> $LOG_FILE
tar -czf $BACKUP_NAME $DIR && aws s3 cp $BACKUP_NAME s3://$BUCKET/

if [ $? -eq 0 ]; then
    echo "[$(date)] Éxito" >> $LOG_FILE
    rm $BACKUP_NAME
else
    echo "[$(date)] Error" >> $LOG_FILE
fi
