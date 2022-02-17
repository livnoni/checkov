## SHOULD PASS: Explicitly set to false
resource "azurerm_container_registry" "ckv_unittest_pass" {
  name                          = "containerRegistry1"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  public_network_access_enabled = false
  tags = {
    yor_trace = "8248a757-ac4a-4b7c-8d1f-f2243696ff22"
  }
}


## SHOULD FAIL: Explicitly set to true
resource "azurerm_container_registry" "ckv_unittest_fail" {
  name                          = "containerRegistry1"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  public_network_access_enabled = true
  tags = {
    yor_trace = "b1333480-4a89-499c-b500-6fe4c9c6a336"
  }
}

## SHOULD FAIL: Not set, default is true
resource "azurerm_container_registry" "ckv_unittest_fail_2" {
  name                = "containerRegistry1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags = {
    yor_trace = "89114689-204d-42b0-8ab7-67da904fc136"
  }
}