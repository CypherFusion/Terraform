output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

output "linux_function_app_name" {
  value = [for fa in azurerm_linux_function_app.fa : fa.name ]
}