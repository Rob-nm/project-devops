# Proyecto DevOps AWS - Gestión y Respaldo

Este proyecto automatiza la gestión de instancias EC2 y el respaldo de directorios en S3 utilizando un flujo de trabajo DevOps profesional.

## 🚀 Funcionalidades
- **Gestión EC2 (Python/Boto3):** Listar, iniciar, detener y terminar instancias.
- **Respaldo S3 (Bash):** Compresión de archivos y carga automatizada a buckets.
- **Orquestación (Shell):** Script `deploy.sh` que integra ambos procesos.
- **Configuración:** Uso de variables de entorno en `config/config.env`.

## 🛠️ Instrucciones de Uso
1. Configurar variables en `config/config.env`:
   ```text
   INSTANCE_ID=tu_id_aqui
   BUCKET_NAME=tu_bucket_aqui
   DIRECTORY=./ruta_a_respaldar
