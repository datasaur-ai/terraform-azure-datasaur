resource "azurerm_subnet" "redis_subnet" {
  name                 = "${var.project_name}-redis-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes
}


# For more configuration options, see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/redis_cache
resource "azurerm_redis_cache" "redis" {
  name                = "${var.project_name}-redis"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  capacity            = 2
  family              = "P"
  sku_name            = "Premium"
  subnet_id = azurerm_subnet.redis_subnet.id
  redis_version = var.redis_version

  enable_non_ssl_port = true
}