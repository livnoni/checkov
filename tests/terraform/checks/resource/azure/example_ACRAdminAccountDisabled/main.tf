## SHOULD PASS: Explicit false
resource "azurerm_container_registry" "ckv_unittest_pass" {
  name                = "containerRegistry1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  admin_enabled       = false
  tags = {
    yor_trace = "e44ff1aa-a339-4a4f-b348-097403fa9cde"
  }
}

## SHOULD PASS: Default false
resource "azurerm_container_registry" "ckv_unittest_pass_2" {
  name                = "containerRegistry1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags = {
    yor_trace = "937a9c80-52c7-4937-88cb-40b9510bd72a"
  }
}

## SHOULD FAIL: Explicit true
resource "azurerm_container_registry" "ckv_unittest_fail" {
  name                = "containerRegistry1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  admin_enabled       = true
  tags = {
    yor_trace = "09e8a2ea-00d0-4cad-9122-9a5988c8074d"
  }
}