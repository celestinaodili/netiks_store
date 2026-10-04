output "vm_acr_pull_role_assignment_id" {
  value = azurerm_role_assignment.vm_acr_pull.id
}

output "github_acr_push_role_assignment_id" {
  value = azurerm_role_assignment.github_acr_push.id
}

output "federated_credential_ids" {
  value = {
    main   = azuread_application_federated_identity_credential.main.id
    v1_1_0 = azuread_application_federated_identity_credential.tag_v1_1_0.id
    v1_2_0 = azuread_application_federated_identity_credential.tag_v1_2_0.id
    v1_3_0 = azuread_application_federated_identity_credential.tag_v1_3_0.id
    v1_3_1 = azuread_application_federated_identity_credential.tag_v1_3_1.id
  }
}