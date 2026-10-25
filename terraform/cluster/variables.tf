variable "cluster_name" {
  description = "Name of the local Kind cluster"
  type        = string
  default     = "netiks"
}

variable "kubeconfig_path" {
  description = "Location for the kubeconfig file outside the repository"
  type        = string
  default     = "~/.kube/netiks.config"
}
