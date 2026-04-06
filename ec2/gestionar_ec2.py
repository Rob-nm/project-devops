import boto3

# Configuración del cliente para conectarse a EC2
# Nota: AWS Learner Lab ya tiene las credenciales en el entorno
ec2 = boto3.client('ec2', region_name='us-east-1')

def listar_instancias():
    """Muestra el ID y el estado de las instancias actuales"""
    print("Buscando instancias...")
    response = ec2.describe_instances()
    
    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            print(f"ID: {instance['InstanceId']} - Estado: {instance['State']['Name']}")

if __name__ == "__main__":
    listar_instancias()
