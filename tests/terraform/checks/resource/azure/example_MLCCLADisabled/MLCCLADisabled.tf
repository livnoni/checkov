## SHOULD PASS: Explicitly define parameter local_auth_enabled to false
resource "azurerm_machine_learning_compute_cluster" "ckv_unittest_pass" {
  name                          = "example"
  location                      = "West Europe"
  vm_priority                   = "LowPriority"
  vm_size                       = "Standard_DS2_v2"
  machine_learning_workspace_id = azurerm_machine_learning_workspace.example.id
  local_auth_enabled            = false

  scale_settings {
    min_node_count                       = 0
    max_node_count                       = 1
    scale_down_nodes_after_idle_duration = "PT30S" # 30 seconds
  }

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "5ff794ad-924a-4f41-be8d-2d1d5087d710"
  }
}

## SHOULD FAIL: Explicitly define parameter local_auth_enabled to true
resource "azurerm_machine_learning_compute_cluster" "ckv_unittest_fail" {
  name                          = "example"
  location                      = "West Europe"
  vm_priority                   = "LowPriority"
  vm_size                       = "Standard_DS2_v2"
  machine_learning_workspace_id = azurerm_machine_learning_workspace.example.id
  local_auth_enabled            = true

  scale_settings {
    min_node_count                       = 0
    max_node_count                       = 1
    scale_down_nodes_after_idle_duration = "PT30S" # 30 seconds
  }

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "ee8e7aa9-fd4a-4465-8e9c-6f5589ad1de4"
  }
}

## SHOULD FAIL: Do not explicitly assign value to local_auth_enabled parameter as default value is true
resource "azurerm_machine_learning_compute_cluster" "ckv_unittest_fail_2" {
  name                          = "example"
  location                      = "West Europe"
  vm_priority                   = "LowPriority"
  vm_size                       = "Standard_DS2_v2"
  machine_learning_workspace_id = azurerm_machine_learning_workspace.example.id

  scale_settings {
    min_node_count                       = 0
    max_node_count                       = 1
    scale_down_nodes_after_idle_duration = "PT30S" # 30 seconds
  }

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "42e702dd-344c-4397-a4fc-6e254f87165c"
  }
}