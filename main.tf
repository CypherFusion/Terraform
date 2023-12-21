module "resource_group" {
  source = "./resource-group"

  resource_group_name = "terraform-rg3"
}

module "virtual_network" {
  source = "./virtual-network"

  resource_group_name = module.resource_group.resource_group_name
  network_security_group_name = "terraform-nsg-3"
  virtual_network_name = "terraform-vn-3"
  subnet_name = "terraform-subnet-3"
}

module "sql_server" {
  source = "./sql-server"

  resource_group_name = module.resource_group.resource_group_name
  sql_server_name = "terraform-server-3"
  sql_db_name = "terraform-db-3"
}

module "function_app" {
  source = "./function-app"

  resource_group_name = module.resource_group.resource_group_name
  storage_account_name = "terraformsa3"
  service_plan_name = "terraform-sp-3"
  function_app_name = "terraform-fa-3"
}

module "container_registry" {
  source = "./container-registry"

  resource_group_name = module.resource_group.resource_group_name
  container_registry_name = "terraformacr3"
}

module "app_service" {
  source = "./app-service"

  resource_group_name = module.resource_group.resource_group_name
  service_plan_name = "terraform-asp3"
  app_service_name = "terraform-as3"
  virtual_network_subnet_id = module.virtual_network.subnet_id
}
