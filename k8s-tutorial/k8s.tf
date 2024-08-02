resource "kubernetes_deployment" "kubernetes-bootcamp" {
  metadata {
    name      = "kubernetes-bootcamp"
    namespace = "default"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "kubernetes-bootcamp"
      }
    }

    template {
      metadata {
        labels = {
          app     = "kubernetes-bootcamp"
          version = "v1"
        }
      }

      spec {
        container {
          name  = "kubernetes-bootcamp"
          image = "docker.io/jocatalin/kubernetes-bootcamp:v2"
        }
      }
    }
  }
}

resource "kubernetes_service" "kubernetes-bootcamp" {
  metadata {
    name      = "kubernetes-bootcamp"
    namespace = "default"
  }

  spec {
    selector = {
      app = "kubernetes-bootcamp"
    }

    port {
      port        = 8080
      target_port = 8080
    }

    type = "NodePort"
  }
}