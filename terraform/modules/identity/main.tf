resource "azurerm_role_assignment" "vm_acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = var.vm_principal_id
}

resource "azurerm_role_assignment" "github_acr_push" {
  scope                = var.acr_id
  role_definition_name = "AcrPush"
  principal_id         = var.github_service_principal_object_id
}

resource "azuread_application_federated_identity_credential" "main" {
  application_id = "/applications/${var.application_id}"
  display_name   = "federated-credential-main"
  description    = "federated cred for main"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = "repo:celestinaodili/netiks_store:ref:refs/heads/main"
}

resource "azuread_application_federated_identity_credential" "tag_v1_1_0" {
  application_id = "/applications/${var.application_id}"
  display_name = "federated-credential-tag-v1-1-0"
  description  = "GitHub Actions federation for release tag v1.1.0"
  audiences = ["api://AzureADTokenExchange"]
  issuer    = "https://token.actions.githubusercontent.com"
  subject   = "repo:celestinaodili/netiks_store:ref:refs/tags/v1.1.0"
}

resource "azuread_application_federated_identity_credential" "tag_v1_2_0" {
  application_id = "/applications/${var.application_id}"
  display_name   = "federated-credential-tag-v1-2-0"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = "repo:celestinaodili/netiks_store:ref:refs/tags/v1.2.0"
}

resource "azuread_application_federated_identity_credential" "tag_v1_3_0" {
  application_id = "/applications/${var.application_id}"
  display_name   = "federated-credential-tag-v1-3-0"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = "repo:celestinaodili/netiks_store:ref:refs/tags/v1.3.0"
}

resource "azuread_application_federated_identity_credential" "tag_v1_3_1" {
  application_id = "/applications/${var.application_id}"
  display_name   = "federated-credential-tag-v1-3-1"
  description    = "GitHub Actions federation for release tag v1.3.1"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = "repo:celestinaodili/netiks_store:ref:refs/tags/v1.3.1"
}
