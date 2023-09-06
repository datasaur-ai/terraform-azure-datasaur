variable "resource_group_name" {
  description = "Resource Group Name"
}

variable "resource_group_location" {
  description = "Resource Group Location"
}

variable "vnet_name" {
  description = "Virtual Network Name"
}

variable "username" {
  description = "Admin username"
}

variable "password" {
  description = "Admin password"
  sensitive = true
}

variable "storage_size" {
  description = "Mariadb storage size"
  default = 1024000
}

variable "mariadb_version" {
  description = "Mariadb storage size"
}

variable "project_name" {
  description = "A name for the project, will be set as cluster name"
}

variable "database_name" {
  description = "Name of the database"
}

variable "backup_retention_days" {
  description = "Mariadb backup retention days"
  default = 7
}

variable "address_prefixes" {
  description = "An array containing CIDR value for the database subnet"
  default = ["10.0.3.0/29"]
}