resource "azurerm_service_plan" "asp" {
  name                      = var.service_plan_name
  location                  = var.resource_group_location
  resource_group_name       = var.resource_group_name
  os_type                   = "Linux"
  sku_name                  = "P0v3"
}

resource "azurerm_linux_web_app" "as" {
  name                      = var.app_service_name
  location                  = var.resource_group_location
  resource_group_name       = var.resource_group_name
  service_plan_id           = azurerm_service_plan.asp.id
  virtual_network_subnet_id = var.virtual_network_subnet_id
  
  site_config {
    always_on = true
  }

  identity {
    type = "SystemAssigned"
  }
}
