# pass

resource "azurerm_kubernetes_cluster" "enabled" {
  name                = "example"
  location            = "azurerm_resource_group.example.location"
  resource_group_name = "azurerm_resource_group.example.name"
  dns_prefix          = "example"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  api_server_authorized_ip_ranges = ["192.168.0.0/16"]
  tags = {
    yor_trace = "f60de93a-c281-47be-92c9-6cee9bbf4045"
  }
}

resource "azurerm_kubernetes_cluster" "private" {
  name                = "example"
  location            = "azurerm_resource_group.example.location"
  resource_group_name = "azurerm_resource_group.example.name"
  dns_prefix          = "example"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  private_cluster_enabled = true
  tags = {
    yor_trace = "69f400ef-41a0-4ef7-b45a-528202dcce9d"
  }
}

# fail

resource "azurerm_kubernetes_cluster" "default" {
  name                = "example"
  location            = "azurerm_resource_group.example.location"
  resource_group_name = "azurerm_resource_group.example.name"
  dns_prefix          = "example"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "9abdafa7-9710-425c-9c8f-62fa34765e21"
  }
}

resource "azurerm_kubernetes_cluster" "empty" {
  name                = "example"
  location            = "azurerm_resource_group.example.location"
  resource_group_name = "azurerm_resource_group.example.name"
  dns_prefix          = "example"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  api_server_authorized_ip_ranges = []
  tags = {
    yor_trace = "9cdd6c3a-955b-4833-a34a-933c6c39ab24"
  }
}
