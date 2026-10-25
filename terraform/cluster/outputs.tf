output "kubeconfig_path" {
  description = "Path to the generated Kind kubeconfig"
  value       = pathexpand(var.kubeconfig_path)
}
