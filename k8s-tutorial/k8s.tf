resource "kubernetes_deployment" "kubernetes-bootcamp" {
  metadata {
    name = "kubernetes-bootcamp"
    namespace = "default"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "kubernetes-bootcamp"
      }
    }

    template {
      metadata {
        labels = {
          app = "kubernetes-bootcamp"
        }
      }

      spec {
        container {
          name = "kubernetes-bootcamp"
          image = "gcr.io/google-samples/kubernetes-bootcamp:v1"
        }
      }
    }
  }
}