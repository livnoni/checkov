resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    yor_trace = "c6b841fc-9936-4f06-baca-cb73d7c881e1"
  }
}

resource "azurerm_sql_server" "sql_server_good" {
  name                         = "mysqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = "West US"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "640a65fe-7172-4d03-8cc8-d8167b309449"
  }
}

resource "azurerm_sql_server" "sql_server_bad" {
  name                         = "mysqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = "West US"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "113654a2-71ac-4bcc-b38a-1d8409455856"
  }
}


resource "azurerm_sql_firewall_rule" "firewall_rule_good" {
  name                = "FirewallRule1"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_sql_server.sql_server_good.name
  start_ip_address    = "10.0.17.62"
  end_ip_address      = "10.0.17.62"
}

resource "azurerm_sql_firewall_rule" "firewall_rule_bad" {
  name                = "FirewallRule1"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_sql_server.sql_server_bad.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
