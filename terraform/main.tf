module "network" {
  source = "./modules/network"

  resource_group_name     = var.resource_group_name
  location                = var.location
  vnet_name               = var.vnet_name
  vnet_address_space      = var.vnet_address_space
  subnet_name             = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
  nsg_name                = var.nsg_name
  public_ip_name          = var.public_ip_name
  nic_name                = var.nic_name
}

module "virtual_machine" {
  source = "./modules/virtual_machine"

  resource_group_name = var.resource_group_name
  location            = var.location

  vm_name = var.vm_name
  vm_size = var.vm_size

  admin_username       = var.admin_username
  admin_ssh_public_key = var.admin_ssh_public_key
  network_interface_id = module.network.network_interface_id

  image_publisher = var.image_publisher
  image_offer     = var.image_offer
  image_sku       = var.image_sku
  image_version   = var.image_version

  os_disk_caching              = var.os_disk_caching
  os_disk_storage_account_type = var.os_disk_storage_account_type
}

module "acr" {
  source = "./modules/acr"

  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.acr_sku
}

module "identity" {
  source = "./modules/identity"

  acr_id                             = module.acr.id
  vm_principal_id                    = module.virtual_machine.principal_id
  application_id                     = var.github_application_id
  github_service_principal_object_id = var.github_service_principal_object_id
}
