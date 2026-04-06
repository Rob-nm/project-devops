import boto3
import sys

ec2 = boto3.client('ec2', region_name='us-east-1')

def gestionar(accion, instance_id=None):
    try:
        if accion == "listar":
            res = ec2.describe_instances()
            for r in res['Reservations']:
                for i in r['Instances']:
                    print(f"ID: {i['InstanceId']} - Estado: {i['State']['Name']}")
        elif accion == "iniciar":
            ec2.start_instances(InstanceIds=[instance_id])
            print(f"Instancia {instance_id} iniciando...")
        elif accion == "detener":
            ec2.stop_instances(InstanceIds=[instance_id])
            print(f"Instancia {instance_id} deteniendo...")
        elif accion == "terminar":
            ec2.terminate_instances(InstanceIds=[instance_id])
            print(f"Instancia {instance_id} ELIMINADA.")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    cmd = sys.argv[1] if len(sys.argv) > 1 else "listar"
    id_ins = sys.argv[2] if len(sys.argv) > 2 else None
    gestionar(cmd, id_ins)
