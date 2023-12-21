variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
}

variable "network_security_group_name" {
  type        = string
  description = "Name of the network security group."
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network."
}

variable "subnet_name" {
  type        = string
  description = "Name of the virtual network subnet."
}