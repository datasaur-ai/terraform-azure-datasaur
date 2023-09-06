resource "azurerm_subnet" "aks" {
  name                 = "${var.project_name}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_kubernetes_cluster" "k8s" {
  location            = var.resource_group_location
  name                = "${var.project_name}-cluster"
  resource_group_name = var.resource_group_name
  dns_prefix          = var.project_name

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "nodepool1"
    vm_size    = var.instance_type
    node_count = var.node_count
    vnet_subnet_id = azurerm_subnet.aks.id
    enable_auto_scaling = var.enable_auto_scaling
    max_count = var.max_node_count
    min_count = var.min_node_count
  }
  
  http_application_routing_enabled = true
}