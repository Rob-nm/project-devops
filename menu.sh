#!/bin/bash

# Cargar configuración inicial
if [ -f config/config.env ]; then
    source config/config.env
else
    echo "⚠️ Archivo de configuración no encontrado."
fi

while true; do
    echo "======================================"
    echo "   SISTEMA DE GESTIÓN DEVOPS - AWS"
    echo "======================================"
    echo "1) Listar instancias EC2"
    echo "2) Iniciar instancia ($INSTANCE_ID)"
    echo "3) Detener instancia ($INSTANCE_ID)"
    echo "4) Terminar instancia (ELIMINAR)"
    echo "5) Realizar Respaldo en S3"
    echo "6) Salir"
    echo "======================================"
    read -p "Seleccione una opción [1-6]: " OPCION

    case $OPCION in
        1) python3 ec2/gestionar_ec2.py listar ;;
        2) python3 ec2/gestionar_ec2.py iniciar $INSTANCE_ID ;;
        3) python3 ec2/gestionar_ec2.py detener $INSTANCE_ID ;;
        4) 
            read -p "⚠️ ¿Seguro que desea TERMINAR la instancia? (s/n): " CONFIRM
            if [ "$CONFIRM" = "s" ]; then
                python3 ec2/gestionar_ec2.py terminar $INSTANCE_ID
            fi
            ;;
        5) bash s3/backup_s3.sh $DIRECTORY $BUCKET_NAME ;;
        6) echo "Saliendo..."; break ;;
        *) echo "Opción no válida." ;;
    esac
    echo -e "\nPresione Enter para continuar..."
    read
done
