output "host" {
  value = "${azurerm_mariadb_server.mariadb.name}.mariadb.database.azure.com"
}

output "username" {
  value = "${azurerm_mariadb_server.mariadb.administrator_login}@${azurerm_mariadb_server.mariadb.name}"
}

output "password" {
  value = azurerm_mariadb_server.mariadb.administrator_login_password
  sensitive = true
}

output "database_name" {
  value = azurerm_mariadb_database.mariadb_database.name
}