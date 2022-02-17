resource "azurerm_kusto_cluster" "cluster_ok" {
  name                = "kustocluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    name     = "Standard_D13_v2"
    capacity = 2
  }

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "2e9a47e9-7e34-4dfa-ba0e-46a4400c0e32"
  }
}

resource "azurerm_kusto_cluster_customer_managed_key" "example" {
  cluster_id   = azurerm_kusto_cluster.cluster_ok.id
  key_vault_id = azurerm_key_vault.example.id
  key_name     = azurerm_key_vault_key.example.name
  key_version  = azurerm_key_vault_key.example.version
}


resource "azurerm_kusto_cluster" "cluster_ok_not_ok" {
  name                = "kustocluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    name     = "Standard_D13_v2"
    capacity = 2
  }

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "c0f72206-2c06-47f8-b496-ebbf3ef79b07"
  }
}