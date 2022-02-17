# pass

resource "azurerm_network_security_rule" "https" {
  name                        = "example"
  access                      = "Allow"
  direction                   = "Inbound"
  network_security_group_name = "azurerm_network_security_group.example.name"
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = "azurerm_resource_group.example.name"

  destination_port_range = 443
  source_address_prefix  = "Internet"
}

resource "azurerm_network_security_rule" "rdp_restricted_prefixes" {
  name                        = "example"
  access                      = "Allow"
  direction                   = "Inbound"
  network_security_group_name = "azurerm_network_security_group.example.name"
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = "azurerm_resource_group.example.name"

  destination_port_range = 3389
  source_address_prefixes = [
    "123.123.123.123/32",
    "10.0.0.0/16"
  ]
}

resource "azurerm_network_security_group" "rdp_restricted" {
  name                = "example"
  location            = "azurerm_resource_group.example.location"
  resource_group_name = "azurerm_resource_group.example.name"

  security_rule {
    name      = "example"
    access    = "Allow"
    direction = "Inbound"
    priority  = 100
    protocol  = "Tcp"

    destination_port_range = 3389
    source_address_prefix  = "10.0.0.0/16"
  }
  tags = {
    yor_trace = "1b56118f-012a-4f99-8062-7b163782b6a1"
  }
}

# fail

resource "azurerm_network_security_rule" "rdp" {
  name                        = "example"
  access                      = "Allow"
  direction                   = "Inbound"
  network_security_group_name = "azurerm_network_security_group.example.name"
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = "azurerm_resource_group.example.name"

  destination_port_range  = 3389
  source_address_prefix   = "*"
  destination_port_ranges = null
  source_address_prefixes = null
}

resource "azurerm_network_security_rule" "all" {
  name                        = "example"
  access                      = "Allow"
  direction                   = "Inbound"
  network_security_group_name = "azurerm_network_security_group.example.name"
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = "azurerm_resource_group.example.name"

  destination_port_range = "*"
  source_address_prefix  = "Internet"
}

resource "azurerm_network_security_rule" "range" {
  name                        = "example"
  access                      = "Allow"
  direction                   = "Inbound"
  network_security_group_name = "azurerm_network_security_group.example.name"
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = "azurerm_resource_group.example.name"

  destination_port_range = "3000-4000"
  source_address_prefix  = "Internet"
}

resource "azurerm_network_security_rule" "ranges_prefixes" {
  name                        = "example"
  access                      = "Allow"
  direction                   = "Inbound"
  network_security_group_name = "azurerm_network_security_group.example.name"
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = "azurerm_resource_group.example.name"

  destination_port_range = null
  source_address_prefix  = null
  destination_port_ranges = [
    3389,
    443
  ]
  source_address_prefixes = [
    "Internet",
    "10.0.0.0/16"
  ]
}

resource "azurerm_network_security_group" "ranges" {
  name                = "example"
  location            = "azurerm_resource_group.example.location"
  resource_group_name = "azurerm_resource_group.example.name"

  security_rule {
    name      = "example"
    access    = "Allow"
    direction = "Inbound"
    priority  = 100
    protocol  = "Tcp"

    destination_port_ranges = [
      "3000-4000",
      "8000-9000"
    ]
    source_address_prefix = "*"
  }
  tags = {
    yor_trace = "3a4fac43-9c41-4fa7-9942-e89013f9170f"
  }
}
