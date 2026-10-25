output "namespaces" {
  value = {
    for environment, namespace in kubernetes_namespace_v1.environment :
    environment => namespace.metadata[0].name
  }
}

output "resource_quotas" {
  value = {
    for environment, quota in kubernetes_resource_quota_v1.environment :
    environment => quota.metadata[0].name
  }
}
