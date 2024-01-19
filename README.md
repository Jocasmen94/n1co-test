# Resumen del pipeline

Este pipeline automatiza el proceso de implementación de una aplicación Node.js en Docker Hub y Amazon EKS (Elastic Kubernetes Service). Implica tres trabajos principales:

Terraform: Administra la provisión de infraestructura en AWS.
Construir y desplegar: Crea la imagen Docker, la empuja a Docker Hub y la despliega en EKS.
Destrucción manual: Destruye la infraestructura manualmente usando Terraform.

# Trigger del pipeline

El pipeline se activa automáticamente cuando se realiza un empuje a la rama main del repositorio.

# Descripción de los Jobs

## Job de Terraform

Configura la configuración de AWS: Configura las credenciales de AWS y la región usando variables de entorno.
Inicializa Terraform: Inicializa Terraform en el directorio de trabajo.
Aplica Terraform: Aplica la configuración de Terraform para provisionar la infraestructura.
Obtiene la configuración del clúster EKS: Obtiene detalles de configuración para el clúster EKS.

## Job de construcción y despliegue

1. Verifica el repositorio: Recupera el código más reciente del repositorio.
2. Configura el entorno de Node.js: Instala la versión especificada de Node.js.
3. Instala dependencias: Instala las dependencias del proyecto usando npm install.
4. Actualiza el AWS CLI: Actualiza el AWS CLI a la versión 2.
5. Inicia sesión en Docker Hub: Inicia sesión en Docker Hub usando las credenciales proporcionadas.
6. Construye la imagen Docker: Construye la imagen Docker usando el Dockerfile.
7. Empuja la imagen Docker: Empuja la imagen construida a Docker Hub.
8. Despliega en EKS:
9. Configura las credenciales de AWS y la región.
10. Actualiza kubeconfig con la información del clúster EKS.
11. Aplica la configuración de despliegue de Kubernetes (deployment.yaml).
12. Verifica el despliegue enumerando pods.

## Job de destrucción manual

1. Verifica el repositorio: Recupera el código más reciente del repositorio.
2. Configura Terraform: Inicializa Terraform en el directorio de trabajo.
3. Elimina la infraestructura: Elimina la infraestructura provisionada usando Terraform.

# Puntos clave

El pipeline utiliza GitHub Actions para la automatización.
Se basa en secretos para información sensible como credenciales de AWS y contraseñas de Docker Hub.
El trabajo build-and-deploy depende de la finalización exitosa del trabajo terraform.
El trabajo manual-destroy debe desencadenarse manualmente cuando sea necesario.

# Notas adicionales

La razón por la que usé Docker Hub en lugar de ECR es porque no pude lograr la conexión. 
Ya he hecho esa conexión de ECR con Azure DevOps y GitLab, pero esta es la primera vez que lo hago con GitHub Actions. 
Si hubiera tenido más tiempo, lo hubiera logrado, ya que he estado muy ocupado en mi trabajo con el proyecto de Cloudformation. 
Solo tuve como 3 horas para terminar el proyecto, pero lo hice con todo mi corazón y con gusto les podría hacer una demostración de cómo funciona todo. Me encantó hacer este proyecto.

 # Demostración

Para la demostración, puedo mostrar cómo:

Crear el proyecto de GitHub Actions.
Configurar el entorno de desarrollo.
Probar la aplicación localmente.
Implementar la aplicación en Docker Hub y EKS.

# Aquí está un diagrama del pipeline de GitHub Actions para explicar el flujo:

    A[Push a main] --> B{Terraform Job}
    B --> C[Checkout Repo]
    C --> D[Setup Terraform]
    D --> E[Configure AWS Credentials]
    E --> F[Terraform Init]
    F --> G[Terraform Apply]
    G --> H[Get ECR URL]
    H --> I[Get Kubernetes Config]
    
    B --> J{Build Job}
    
    J --> K[Checkout Repo]
    K --> L[Setup Node.js] 
    L --> M[Install Dependencies]
    M --> N[Upgrade AWS CLI]
    N --> O[Login to DockerHub]
    O --> P[Build Docker Image]
    P --> Q[Push to DockerHub]
    Q --> R[Deploy to EKS]
    
    J --> S{Destroy Job}
    
    S --> T[Checkout Repo]
    T --> U[Setup Terraform]
    U --> V[Configure AWS Credentials] 
    V --> W[Terraform Init]
    W --> X[Terraform Destroy]

## Diagrama Basico con componentes

![image](https://github.com/Jocasmen94/n1co-test/assets/97995155/07b6d56f-1d78-44c2-86ab-b15b68e74385)


