variable "resource_group_name" {
  description = "Resource Group Name"
}

variable "resource_group_location" {
  description = "Resource Group Location"
}

variable "vnet_name" {
  description = "Virtual Network Name"
}

variable "redis_version" {
  description = "Version of the Redis"
  default = 6
}

variable "project_name" {
  description = "A name for the project, will be set as cluster name"
}

variable "address_prefixes" {
  description = "An array containing CIDR value for the Redis subnet"
  default = ["10.0.2.0/24"]
}