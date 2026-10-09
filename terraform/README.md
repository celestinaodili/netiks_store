# Netiks Store — Terraform Infrastructure

Terraform manages the existing infrastructure for Netiks Store. The existing Azure resources were imported into Terraform rather than recreated, allowing the infrastructure to be managed as code without replacing the existing VM or application environment.

## Structure

```text
terraform/
├── providers.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── modules/
    ├── virtual_machine/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── network/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── acr/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── identity/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```
## Modules
- virtual_machine — Manages the existing Ubuntu VM and its system-assigned managed identity.
- network — Manages the VNet, subnet, NSG, public ip, nic, nic-nsg association and inbound rules for SSH, HTTP, HTTPS, and staging port 8080.
- acr — Manages the Azure Container Registry used by Netiks Store.
- identity — Manages ACR role assignments and GitHub Actions federated identity credentials.

## Requirements
- Terraform >= 1.6
- Azure CLI
- An Azure subscription with access to the existing resources

## Providers used:
- azurerm ~> 4.0
- azuread ~> 3.0

## Usage
- Create terraform modules and configuration files
- Add configuration codes
- Initialize Terraform:
  run `terraform init` 
- Format the configuration:
  run `terraform fmt -recursive`
- Validate the configuration:
  run `terraform validate` 
- Import existing resources:<br>
    syntax
    <br>
    `terraform import '<RESOURCE_ADDRESS>' '<AZURE_RESOURCE_ID>'`
    <br>
     e.g <br>
    `terraform import \
      'module.network.azurerm_virtual_network.netiks_vnet' \
      '/subscriptions/f3ca27ed-b51f-4430-878d-2572eb18269a/resourceGroups/netiks-dev-celestina-odili-rg/providers/Microsoft.Network/virtualNetworks/vnet-eastus2-2'`
- Review the planned changes:
run `terraform plan`  
- Apply changes only after the reviewed plan is satisfactory:
  run `terraform apply`   
