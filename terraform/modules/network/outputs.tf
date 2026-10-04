output "vnet_id" {
  value = azurerm_virtual_network.netiks_vnet.id
}

output "subnet_id" {
  value = azurerm_subnet.netiks_subnet.id
}

output "nsg_id" {
  value = azurerm_network_security_group.netiks_nsg.id
}