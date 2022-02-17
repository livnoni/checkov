# pass

resource "azurerm_linux_virtual_machine" "disabled" {
  admin_password      = "admin"
  admin_username      = "admin123"
  location            = "azurerm_resource_group.test.location"
  name                = "linux-vm"
  resource_group_name = "azurerm_resource_group.test.name"
  size                = "Standard_F2"

  network_interface_ids = [
    "azurerm_network_interface.test.id"
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  allow_extension_operations = false
  tags = {
    yor_trace = "d97323ec-709a-47d4-ba2d-60b9aa71b169"
  }
}

resource "azurerm_windows_virtual_machine" "disabled" {
  admin_password      = "admin"
  admin_username      = "admin123"
  location            = "azurerm_resource_group.test.location"
  name                = "win-vm"
  resource_group_name = "azurerm_resource_group.test.name"
  size                = "Standard_F2"

  network_interface_ids = [
    "azurerm_network_interface.test.id"
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  allow_extension_operations = false
  tags = {
    yor_trace = "3fc32706-1278-4139-8196-9e11315df922"
  }
}

# fail

resource "azurerm_linux_virtual_machine" "default" {
  admin_password      = "admin"
  admin_username      = "admin123"
  location            = "azurerm_resource_group.test.location"
  name                = "linux-vm"
  resource_group_name = "azurerm_resource_group.test.name"
  size                = "Standard_F2"

  network_interface_ids = [
    "azurerm_network_interface.test.id"
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  tags = {
    yor_trace = "c50da07f-6c60-400d-ade7-c13d2e5e27b4"
  }
}

resource "azurerm_linux_virtual_machine" "enabled" {
  admin_password      = "admin"
  admin_username      = "admin123"
  location            = "azurerm_resource_group.test.location"
  name                = "linux-vm"
  resource_group_name = "azurerm_resource_group.test.name"
  size                = "Standard_F2"

  network_interface_ids = [
    "azurerm_network_interface.test.id"
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  allow_extension_operations = true
  tags = {
    yor_trace = "d5dee6fd-8ea6-4484-ac29-3ba2c6b1648b"
  }
}

resource "azurerm_windows_virtual_machine" "default" {
  admin_password      = "admin"
  admin_username      = "admin123"
  location            = "azurerm_resource_group.test.location"
  name                = "win-vm"
  resource_group_name = "azurerm_resource_group.test.name"
  size                = "Standard_F2"

  network_interface_ids = [
    "azurerm_network_interface.test.id"
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  tags = {
    yor_trace = "b6642cfc-697a-46fe-80bc-12eed377f508"
  }
}

resource "azurerm_windows_virtual_machine" "enabled" {
  admin_password      = "admin"
  admin_username      = "admin123"
  location            = "azurerm_resource_group.test.location"
  name                = "win-vm"
  resource_group_name = "azurerm_resource_group.test.name"
  size                = "Standard_F2"

  network_interface_ids = [
    "azurerm_network_interface.test.id"
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  allow_extension_operations = true
  tags = {
    yor_trace = "d8961f24-362f-4d3c-afd1-f93456bf3fd4"
  }
}
