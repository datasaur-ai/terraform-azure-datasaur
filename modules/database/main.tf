resource "azurerm_subnet" "mariadb_subnet" {
  name                 = "${var.project_name}-mariadb-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes
  service_endpoints    = ["Microsoft.Sql"]
}

resource "azurerm_mariadb_server" "mariadb" {
  name                = "${var.project_name}-mariadb-svr"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  sku_name = "GP_Gen5_2"

  storage_mb                   = var.storage_size
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = false

  administrator_login          = var.username
  administrator_login_password = var.password
  version                      = var.mariadb_version
  ssl_enforcement_enabled      = false
  
}

resource "azurerm_mariadb_firewall_rule" "mariadb_firewall_rule" {
  name = "mariadb_firewall_rule"
  server_name = azurerm_mariadb_server.mariadb.name
  resource_group_name = var.resource_group_name
  start_ip_address = "0.0.0.0"
  end_ip_address = "0.0.0.0"
  depends_on = [ azurerm_mariadb_server.mariadb ]
}

resource "azurerm_mariadb_virtual_network_rule" "mariadb_network_rule" {
  name                = "mariadb-vnet-rule"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mariadb_server.mariadb.name
  subnet_id           = azurerm_subnet.mariadb_subnet.id
  depends_on = [ azurerm_mariadb_server.mariadb ]
}

resource "azurerm_mariadb_database" "mariadb_database" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mariadb_server.mariadb.name
  charset             = "utf8mb4"
  collation           = "utf8mb4_unicode_520_ci"

  depends_on = [ azurerm_mariadb_server.mariadb ]
}

resource "azurerm_mariadb_server" "read_replica" {
  name                = "${var.project_name}-mariadb-replica-svr"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  sku_name = "GP_Gen5_2"

  storage_mb                   = var.storage_size
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = false

  administrator_login          = var.username
  administrator_login_password = var.password
  version                      = var.mariadb_version
  ssl_enforcement_enabled      = false

  create_mode = "Replica"
  creation_source_server_id = azurerm_mariadb_server.mariadb.id
  
  depends_on = [ azurerm_mariadb_server.mariadb ]
}
