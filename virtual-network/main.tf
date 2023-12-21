resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_virtual_network" "vn" {
  name                = var.virtual_network_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = ["10.0.1.0/24"]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/action", "Microsoft.Network/virtualNetworks/read", "Microsoft.Network/networkinterfaces/*"]
    }
  }
}