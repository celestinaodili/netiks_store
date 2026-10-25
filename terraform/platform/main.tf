resource "kubernetes_namespace_v1" "environment" {
  for_each = var.environments

  metadata {
    name = each.value.namespace

    labels = {
      app         = "netiks-store"
      environment = each.key
    }
  }
}

resource "kubernetes_resource_quota_v1" "environment" {
  for_each = var.environments

  metadata {
    name      = "netiks-quota"
    namespace = kubernetes_namespace_v1.environment[each.key].metadata[0].name
  }

  spec {
    hard = {
      "requests.cpu"    = each.value.quota.requests_cpu
      "requests.memory" = each.value.quota.requests_memory
      "limits.memory"   = each.value.quota.limits_memory
      "pods"            = each.value.quota.pods
    }
  }
}
