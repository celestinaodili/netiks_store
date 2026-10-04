output "vm_id" {
  value = module.virtual_machine.vm_id
}

output "vm_name" {
  value = module.virtual_machine.vm_name
}

output "vm_principal_id" {
  value = module.virtual_machine.principal_id
}

output "vnet_id" {
  value = module.network.vnet_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "nsg_id" {
  value = module.network.nsg_id
}

output "acr_id" {
  value = module.acr.id
}

output "acr_login_server" {
  value = module.acr.login_server
}

output "vm_acr_pull_role_assignment_id" {
  value = module.identity.vm_acr_pull_role_assignment_id
}

output "github_acr_push_role_assignment_id" {
  value = module.identity.github_acr_push_role_assignment_id
}

output "federated_credential_ids" {
  value = module.identity.federated_credential_ids
}
