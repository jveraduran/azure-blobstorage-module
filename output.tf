output "primary_access_key" {
  value = "${azurerm_storage_account.main.primary_access_key}"
}

output "secondary_access_key" {
  value = "${azurerm_storage_account.main.secondary_access_key}"
}

output "primary_connection_string" {
  value = "${azurerm_storage_account.main.primary_connection_string}"
}

output "secondary_connection_string" {
  value = "${azurerm_storage_account.main.secondary_connection_string}"
}