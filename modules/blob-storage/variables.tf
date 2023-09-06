variable "resource_group_name" {
  description = "Resource Group Name"
}

variable "resource_group_location" {
  description = "Resource Group Location"
}

variable "storage_account_name" {
  description = "Storage Account Name"
}

variable "storage_container_name" {
  description = "Storage Container Name"
}

variable "container_access_type" {
  description = "Container Access Type (private | blob | container)"
}

variable "tags" {
  description = "Tags for the resource"
}