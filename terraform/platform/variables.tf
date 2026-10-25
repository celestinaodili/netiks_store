variable "kubeconfig_path" {
  description = "Path to the kubeconfig for the local Netiks Kind cluster"
  type        = string
  default     = "~/.kube/netiks.config"
}

variable "environments" {
  description = "Namespace and resource quota settings for each environment"

  type = map(object({
    namespace = string

    quota = object({
      requests_cpu    = string
      requests_memory = string
      limits_memory   = string
      pods            = string
    })
  }))
}
