resource "azurerm_linux_virtual_machine" "netiks_vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  bypass_platform_safety_checks_on_user_schedule_enabled = true

  admin_username                  = var.admin_username
  disable_password_authentication = true

  secure_boot_enabled = true
  vtpm_enabled        = true

  additional_capabilities {
    hibernation_enabled = false
    ultra_ssd_enabled   = false
  }

  boot_diagnostics {
    storage_account_uri = null
  }

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.admin_ssh_public_key
  }

  network_interface_ids = [
    var.network_interface_id
  ]

  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [
      admin_ssh_key
  ]
}

}
