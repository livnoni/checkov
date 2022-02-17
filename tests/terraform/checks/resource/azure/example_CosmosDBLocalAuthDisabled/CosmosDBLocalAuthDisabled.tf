## SHOULD PASS: Explicitly setting local_authentication_disabled to true
resource "azurerm_cosmosdb_account" "ckv_unittest_pass" {
  name                          = "cosmos-db"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  offer_type                    = "Standard"
  kind                          = "MongoDB"
  local_authentication_disabled = true

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    location          = azurerm_resource_group.rg.location
    failover_priority = 0
  }
  tags = {
    yor_trace = "858acba7-c89b-4f8f-98f8-60dfd74d9562"
  }
}

## SHOULD FAIL: Explicitly setting local_authentication_disabled to false
resource "azurerm_cosmosdb_account" "ckv_unittest_fail" {
  name                          = "cosmos-db"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  offer_type                    = "Standard"
  kind                          = "MongoDB"
  local_authentication_disabled = false

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    location          = azurerm_resource_group.rg.location
    failover_priority = 0
  }
  tags = {
    yor_trace = "09d5b3df-e227-4a45-833f-a3e11a2626af"
  }
}

## SHOULD FAIL: Default value of local_authentication_disabled is false
resource "azurerm_cosmosdb_account" "ckv_unittest_fail_2" {
  name                = "cosmos-db"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "MongoDB"

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    location          = azurerm_resource_group.rg.location
    failover_priority = 0
  }
  tags = {
    yor_trace = "55acfdd4-f737-4f2c-8d95-1b1d6ec6afa2"
  }
}