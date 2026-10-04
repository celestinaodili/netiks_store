output "vm_id" {
  value = azurerm_linux_virtual_machine.netiks_vm.id
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.netiks_vm.name
}

output "principal_id" {
  value = azurerm_linux_virtual_machine.netiks_vm.identity[0].principal_id
}