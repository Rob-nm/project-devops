import boto3
import sys

# Cliente EC2
ec2 = boto3.client('ec2', region_name='us-east-1')

def listar_instancias():
    print("Buscando instancias...")
    response = ec2.describe_instances()
    for res in response['Reservations']:
        for ins in res['Instances']:
            print(f"ID: {ins['InstanceId']} - Estado: {ins['State']['Name']}")

def iniciar_instancia(instance_id):
    print(f"Iniciando instancia {instance_id}...")
    ec2.start_instances(InstanceIds=[instance_id])

def detener_instancia(instance_id):
    print(f"Deteniendo instancia {instance_id}...")
    ec2.stop_instances(InstanceIds=[instance_id])

if __name__ == "__main__":
    # Verifica si el usuario pasó argumentos (ej: stop i-123...)
    if len(sys.argv) > 2:
        accion = sys.argv[1].lower()
        id_ins = sys.argv[2]
        
        if accion == "start":
            iniciar_instancia(id_ins)
        elif accion == "stop":
            detener_instancia(id_ins)
        else:
            print("Acción no válida. Usa 'start' o 'stop'.")
    else:
        listar_instancias()
