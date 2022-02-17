resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    yor_trace = "781399f7-daa2-4a90-a0be-817320d5093a"
  }
}

resource "azurerm_synapse_workspace" "workspace_good" {
  name                             = "example"
  sql_administrator_login          = "sqladminuser"
  sql_administrator_login_password = "H@Sh1CoR3!"
  managed_virtual_network_enabled  = true
  tags = {
    Env       = "production"
    yor_trace = "5acae915-cd84-408a-b81f-cd6cca8dfda6"
  }
}

resource "azurerm_synapse_workspace" "workspace_bad" {
  name                             = "example"
  sql_administrator_login          = "sqladminuser"
  sql_administrator_login_password = "H@Sh1CoR3!"
  tags = {
    Env       = "production"
    yor_trace = "af8a9ab3-5938-4f2e-89cd-1c982a360439"
  }
}

resource "azurerm_synapse_firewall_rule" "firewall_rule" {
  name                 = "AllowAll"
  synapse_workspace_id = azurerm_synapse_workspace.workspace_bad.id
  start_ip_address     = "0.0.0.0"
  end_ip_address       = "255.255.255.255"
}