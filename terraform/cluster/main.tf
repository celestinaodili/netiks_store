resource "kind_cluster" "netiks" {
  name            = var.cluster_name
  kubeconfig_path = pathexpand(var.kubeconfig_path)
  wait_for_ready  = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"

      extra_port_mappings {
        container_port = 30300
        host_port      = 3001
        protocol       = "TCP"
      }

      extra_port_mappings {
        container_port = 30800
        host_port      = 8000
        protocol       = "TCP"
      }
    }
  }
}
