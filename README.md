# Proyecto Kubernetes con Terraform

Este proyecto utiliza **Terraform** para crear un clúster de Kubernetes y desplegar una aplicación web básica compuesta por tres servicios:

- Un servidor **Nginx**.
- Una base de datos **PostgreSQL**.
- Una aplicación **Python** que interactúa con ambos servicios.

## Requisitos Previos

Antes de ejecutar este proyecto, necesitas tener los siguientes requisitos:

1. **Minikube** instalado en tu máquina local. Minikube es una herramienta para ejecutar Kubernetes en tu máquina local.
   
   Puedes instalarlo siguiendo la [guía oficial de Minikube](https://minikube.sigs.k8s.io/docs/).

2. **kubectl** instalado. Kubectl es la herramienta de línea de comandos para interactuar con tu clúster de Kubernetes.

   Puedes instalarlo siguiendo la [guía oficial de kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/).

3. **Terraform** instalado. Terraform es una herramienta de infraestructura como código (IaC) utilizada para crear, cambiar y administrar infraestructura en la nube.

   Puedes instalarlo siguiendo la [guía oficial de Terraform](https://www.terraform.io/docs/cli/install).

4. Tener un clúster de Kubernetes corriendo. Si no tienes uno configurado, puedes usar Minikube para crear uno. Para iniciar el clúster con Minikube, ejecuta el siguiente comando:

```bash
minikube start
```

   ## Pasos para Ejecutar el Proyecto
   ### 1. Inicializar Terraform

```bash
terraform init
```

 ### 2. Aplicar la Configuración de Terraform

```bash
terraform apply
```

 ### 3. Verificar los Servicios
 #### Nginx

```bash
minikube service nginx-service
```

 #### App Python

```bash
minikube service python-app-service
```
