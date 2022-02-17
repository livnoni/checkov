# pass

resource "azurerm_virtual_machine" "no_secret" {
  name                  = "${var.prefix}-vm"
  location              = ""
  network_interface_ids = []
  resource_group_name   = ""
  vm_size               = ""
  storage_os_disk {
    create_option = ""
    name          = ""
  }

  os_profile {
    admin_username = "example"
    computer_name  = "hostname"
    custom_data    = <<EOF
example
EOF
  }
  tags = {
    yor_trace = "6580f1d3-8279-4999-a333-6e56f477db81"
  }
}

resource "azurerm_virtual_machine" "no_custom_data" {
  name                  = "${var.prefix}-vm"
  location              = ""
  network_interface_ids = []
  resource_group_name   = ""
  vm_size               = ""
  storage_os_disk {
    create_option = ""
    name          = ""
  }

  os_profile {
    admin_username = "example"
    computer_name  = "hostname"
  }
  tags = {
    yor_trace = "465e582e-bebe-4b41-b2de-9f7b8358fd06"
  }
}

resource "azurerm_virtual_machine" "empty_os_profile" {
  name                  = "${var.prefix}-vm"
  location              = ""
  network_interface_ids = []
  resource_group_name   = ""
  vm_size               = ""
  storage_os_disk {
    create_option = ""
    name          = ""
  }

  os_profile = [] # just for a test
  tags = {
    yor_trace = "cd2ad751-4555-4002-8a66-463ba63a192f"
  }
}

resource "azurerm_virtual_machine" "no_os_profile" {
  name                  = "${var.prefix}-vm"
  location              = ""
  network_interface_ids = []
  resource_group_name   = ""
  vm_size               = ""
  storage_os_disk {
    create_option = ""
    name          = ""
  }
  tags = {
    yor_trace = "f68f982a-d74a-4d3d-8238-3a4c04656208"
  }
}

# fail

resource "azurerm_virtual_machine" "secret" {
  name                  = "${var.prefix}-vm"
  location              = ""
  network_interface_ids = []
  resource_group_name   = ""
  vm_size               = ""
  storage_os_disk {
    create_option = ""
    name          = ""
  }

  os_profile {
    admin_username = "example"
    computer_name  = "hostname"
    custom_data    = <<EOF
0000-0000-0000-0000-000000000000
EOF
  }
  tags = {
    yor_trace = "a7d50c36-e3b9-4fff-93a2-5913e86f8d73"
  }
}