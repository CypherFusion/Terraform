resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version = "TLS1_2"
}

resource "azurerm_service_plan" "sp" {
  name                = var.service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku_name            = "Y1"
  os_type             = "Linux"
}

locals {
  function_app_names_location_map = {
    "${var.function_app_name}-1" = "eastus"
    "${var.function_app_name}-2" = "eastus"
  }
}

resource "azurerm_linux_function_app" "fa" {
  for_each                    = local.function_app_names_location_map

  name                        = each.key
  location                    = each.value
  resource_group_name         = var.resource_group_name
  service_plan_id             = azurerm_service_plan.sp.id
  storage_account_name        = azurerm_storage_account.sa.name
  storage_account_access_key  = azurerm_storage_account.sa.primary_access_key
  https_only                  = true
  builtin_logging_enabled     = false

  virtual_network_subnet_id   = var.virtual_network_subnet_id

  site_config {
    application_stack {
      node_version = "18"
    }
  }
}
