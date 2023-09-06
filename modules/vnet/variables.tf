variable "resource_group_name" {
  description = "Resource Group Name"
}

variable "resource_group_location" {
  description = "Resource Group Location"
}

variable "project_name" {
  description = "A name for the project, will be set as cluster name"
}

variable "address_space" {
  description = "An array containing CIDR value for the VPC"
  default = ["10.0.0.0/16"]
}