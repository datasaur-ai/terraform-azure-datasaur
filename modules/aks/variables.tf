variable "resource_group_name" {
  description = "Resource Group Name"
}

variable "resource_group_location" {
  description = "Resource Group Location"
}

variable "vnet_name" {
  description = "Virtual Network Name"
}

variable "node_count" {
  description = "Node count for Kubernetes Cluster"
  default = 3
}

variable "enable_auto_scaling" {
  description = "Enable Auto Scaling"
  default = false
}

variable "min_node_count" {
  description = "Minimum number of node for Kubernetes Cluster. Requires Auto Scaling to be enabled"
  default = null
}

variable "max_node_count" {
  description = "Maximum number of node for Kubernetes Cluster. Requires Auto Scaling to be enabled"
  default = null
}

variable "instance_type" {
  description = "Instance type for the nodepool VM"
  default = "Standard_B4ms"
}

variable "project_name" {
  description = "A name for the project, will be set as cluster name"
}

variable "address_prefixes" {
  description = "An array containing CIDR value for the AKS subnet"
  default = ["10.0.1.0/24"]
}