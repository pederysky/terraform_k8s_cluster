terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

# PostgreSQL Deployment
resource "kubernetes_deployment" "postgres" {
  metadata {
    name = "postgres-deployment"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "postgres"
      }
    }

    template {
      metadata {
        labels = {
          app = "postgres"
        }
      }

      spec {
        container {
          name  = "postgres"
          image = "postgres:15"

          env {
            name  = "POSTGRES_USER"
            value = "admin"
          }

          env {
            name  = "POSTGRES_PASSWORD"
            value = "password"
          }

          port {
            container_port = 5432
          }
        }
      }
    }
  }
}

# PostgreSQL Service
resource "kubernetes_service" "postgres_service" {
  metadata {
    name = "postgres-service"
  }

  spec {
    selector = {
      app = "postgres"
    }

    port {
      port        = 5432
      target_port = 5432
    }

    type = "ClusterIP"
  }
}

# Nginx Deployment
resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx-deployment"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx:alpine"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

# Nginx Service
resource "kubernetes_service" "nginx_service" {
  metadata {
    name = "nginx-service"
  }

  spec {
    selector = {
      app = "nginx"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}

# Python App Deployment
resource "kubernetes_deployment" "python_app" {
  metadata {
    name = "python-app-deployment"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "python-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "python-app"
        }
      }

      spec {
        container {
          name  = "python-app"
          image = "python:3.11-slim"

          command = [
            "python",
            "-m",
            "http.server",
            "5000"
          ]

          port {
            container_port = 5000
          }
        }
      }
    }
  }
}

# Python App Service
resource "kubernetes_service" "python_app_service" {
  metadata {
    name = "python-app-service"
  }

  spec {
    selector = {
      app = "python-app"
    }

    port {
      port        = 5000
      target_port = 5000
    }

    type = "NodePort"
  }
}
