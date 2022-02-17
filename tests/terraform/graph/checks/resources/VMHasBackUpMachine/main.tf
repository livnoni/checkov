
resource "azurerm_virtual_machine" "example_ok" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"
  tags = {
    yor_trace = "6f6391a4-d391-4ca2-9d1b-92c4787fd5e5"
  }
}

resource "azurerm_backup_protected_vm" "vm_protected_backup" {
  resource_group_name = azurerm_resource_group.example_ok.name
  recovery_vault_name = azurerm_recovery_services_vault.example_ok.name
  source_vm_id        = azurerm_virtual_machine.example_ok.id
  backup_policy_id    = azurerm_backup_policy_vm.example_ok.id
  tags = {
    yor_trace = "261859aa-a019-4656-bae4-a01af2290b87"
  }
}


resource "azurerm_virtual_machine" "example_not_ok" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"
  tags = {
    yor_trace = "81674eed-741d-4f51-bc99-cfaa446f6c08"
  }
}
