resource "azurerm_resource_group" "group" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    yor_trace = "88620793-f4c0-4ac1-afb5-ee182240760c"
  }
}

resource "azurerm_managed_disk" "managed_disk_good_1" {
  name                 = "acctestmd"
  location             = "West US 2"
  resource_group_name  = azurerm_resource_group.group.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"

  encryption_settings {
    enabled = true
  }
  tags = {
    environment = "staging"
    yor_trace   = "d3a499ef-33c0-4bc4-b099-5bce23e8e3d6"
  }
}

resource "azurerm_managed_disk" "managed_disk_good_2" {
  name                   = "acctestmd"
  location               = "West US 2"
  resource_group_name    = azurerm_resource_group.group.name
  storage_account_type   = "Standard_LRS"
  create_option          = "Empty"
  disk_size_gb           = "1"
  disk_encryption_set_id = "12345"
  tags = {
    environment = "staging"
    yor_trace   = "6ed6ee3e-26ce-4407-8060-c1013623bb4a"
  }
}

resource "azurerm_managed_disk" "managed_disk_good_3" {
  name                 = "acctestmd"
  location             = "West US 2"
  resource_group_name  = azurerm_resource_group.group.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"
  tags = {
    environment = "staging"
    yor_trace   = "f0f82ff9-6e4a-4f6c-8321-9bae6ed06037"
  }

  encryption_settings {
    enabled = true
  }
}

resource "azurerm_managed_disk" "managed_disk_bad_1" {
  name                 = "acctestmd"
  location             = "West US 2"
  resource_group_name  = azurerm_resource_group.group.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"
  tags = {
    environment = "staging"
    yor_trace   = "6d5b7ebf-8c96-4d89-8dc6-f2300a84e13a"
  }
}

resource "azurerm_managed_disk" "managed_disk_bad_2" {
  name                 = "acctestmd"
  location             = "West US 2"
  resource_group_name  = azurerm_resource_group.group.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"
  encryption_settings {
    enabled = false
  }
  tags = {
    environment = "staging"
    yor_trace   = "f2ce36bd-cef1-42ae-8e48-07cda41a85d6"
  }
}

resource "azurerm_virtual_machine" "virtual_machine_good_1" {
  name                  = "$vm"
  location              = "location"
  resource_group_name   = azurerm_resource_group.group.name
  network_interface_ids = ["id"]
  vm_size               = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name            = "myosdisk1"
    caching         = "ReadWrite"
    create_option   = "FromImage"
    managed_disk_id = azurerm_managed_disk.managed_disk_good_1.id
  }
  tags = {
    yor_trace = "c98ba8f3-93da-4d5a-a63a-bdd1c368c769"
  }
}

resource "azurerm_virtual_machine" "virtual_machine_good_2" {
  name                  = "$vm"
  location              = "location"
  resource_group_name   = azurerm_resource_group.group.name
  network_interface_ids = ["id"]
  vm_size               = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name            = "myosdisk1"
    caching         = "ReadWrite"
    create_option   = "FromImage"
    managed_disk_id = azurerm_managed_disk.managed_disk_good_2.id
  }
  tags = {
    yor_trace = "317c7671-eb97-4bd0-af52-5ae55aa25540"
  }
}


resource "azurerm_virtual_machine" "virtual_machine_good_3" {
  name                  = "$vm"
  location              = "location"
  resource_group_name   = azurerm_resource_group.group.name
  network_interface_ids = ["id"]
  vm_size               = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "managed"
  }
  tags = {
    yor_trace = "ca0226a2-66e1-477a-a85b-d2f4cd108aeb"
  }
}


resource "azurerm_virtual_machine" "virtual_machine_bad_1" {
  name                  = "$vm"
  location              = "location"
  resource_group_name   = azurerm_resource_group.group.name
  network_interface_ids = ["id"]
  vm_size               = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = azurerm_managed_disk.managed_disk_bad_1.id
  }
  tags = {
    yor_trace = "7a4caaf6-594c-4d8f-8cca-e744241d3547"
  }
}

resource "azurerm_virtual_machine" "virtual_machine_bad_2" {
  name                  = "$vm"
  location              = "location"
  resource_group_name   = azurerm_resource_group.group.name
  network_interface_ids = ["id"]
  vm_size               = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = azurerm_managed_disk.managed_disk_bad_2.id
  }
  tags = {
    yor_trace = "79a793f7-342c-4a17-aa4f-b8aadc7b3f24"
  }
}