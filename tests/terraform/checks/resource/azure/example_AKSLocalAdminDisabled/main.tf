## SHOULD PASS: Explicitly disabled
resource "azurerm_kubernetes_cluster" "ckv_unittest_pass" {
  name                   = "example-aks1"
  location               = azurerm_resource_group.example.location
  resource_group_name    = azurerm_resource_group.example.name
  local_account_disabled = true

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
    yor_trace   = "8a5368f0-1e92-4177-93a3-b692fa57df97"
  }
}

## SHOULD FAIL: Default is enabled
resource "azurerm_kubernetes_cluster" "ckv_unittest_fail" {
  name                = "example-aks1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
    yor_trace   = "996a72fa-4e84-42bf-a6e0-4640a73ed441"
  }
}

## SHOULD FAIL: Explicitly enabled
resource "azurerm_kubernetes_cluster" "ckv_unittest_fail_2" {
  name                   = "example-aks1"
  location               = azurerm_resource_group.example.location
  resource_group_name    = azurerm_resource_group.example.name
  local_account_disabled = false

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
    yor_trace   = "d1ec2516-ecbf-477a-ac80-a8c1bffb5278"
  }
}
