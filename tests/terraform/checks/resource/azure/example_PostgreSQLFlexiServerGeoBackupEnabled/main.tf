# pass

resource "azurerm_postgresql_flexible_server" "pass" {
  name                   = "example-psqlflexibleserver"
  resource_group_name    = "azurerm_resource_group.example.name"
  location               = "azurerm_resource_group.example.location"
  version                = "12"
  delegated_subnet_id    = "azurerm_subnet.example.id"
  private_dns_zone_id    = "azurerm_private_dns_zone.example.id"
  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"
  zone                   = "1"

  storage_mb                   = 32768
  geo_redundant_backup_enabled = true

  sku_name   = "GP_Standard_D4s_v3"
  depends_on = ["azurerm_private_dns_zone_virtual_network_link.example"]

  tags = {
    yor_trace = "4a74ff6a-fcd1-4b83-b685-eb91e30a8638"
  }
}

# fail

resource "azurerm_postgresql_flexible_server" "fail1" {
  name                   = "example-psqlflexibleserver"
  resource_group_name    = "azurerm_resource_group.example.name"
  location               = "azurerm_resource_group.example.location"
  version                = "12"
  delegated_subnet_id    = "azurerm_subnet.example.id"
  private_dns_zone_id    = "azurerm_private_dns_zone.example.id"
  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"
  zone                   = "1"

  storage_mb                   = 32768
  geo_redundant_backup_enabled = false

  sku_name   = "GP_Standard_D4s_v3"
  depends_on = ["azurerm_private_dns_zone_virtual_network_link.example"]

  tags = {
    yor_trace = "def59ae3-aebb-4395-9970-8647657aeaf5"
  }
}

resource "azurerm_postgresql_flexible_server" "fail2" {
  name                   = "example-psqlflexibleserver"
  resource_group_name    = "azurerm_resource_group.example.name"
  location               = "azurerm_resource_group.example.location"
  version                = "12"
  delegated_subnet_id    = "azurerm_subnet.example.id"
  private_dns_zone_id    = "azurerm_private_dns_zone.example.id"
  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"
  zone                   = "1"

  storage_mb = 32768

  sku_name   = "GP_Standard_D4s_v3"
  depends_on = ["azurerm_private_dns_zone_virtual_network_link.example"]

  tags = {
    yor_trace = "e573750f-da6f-4171-a3d6-73ea62613421"
  }
}


