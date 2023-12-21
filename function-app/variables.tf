variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account for the function app."
}

variable "service_plan_name" {
  type        = string
  description = "Name of the service plan for the function app."
}

variable "function_app_name" {
  type        = string
  description = "Name of the function app."
}

variable "virtual_network_subnet_id" {
  type        = string
  description = "Id of the virtual network subnet to attach this service to."
  default     = null
}