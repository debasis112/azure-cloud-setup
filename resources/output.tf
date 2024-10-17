# output "rsg-01-location" {
#   value = data.azurerm_resource_group.rsg-01.location
# }

# # output "rsg-01-tags" {
# #   value = data.azurerm_resource_group.rsg-01.tags
# # }

# output "rsg-01-name" {
#   value = data.azurerm_resource_group.rsg-01.name
# }

# output "sql-server-01-id" {
#   value = data.azurerm_mssql_server.sql-server-01.id
# }

# output "sql-server-01-name" {
#   value = data.azurerm_mssql_server.sql-server-01.name
# }

# # output "sql-server-01-fqdn" {
# #   value = data.azurerm_mssql_server.sql-server-01.fully_qualified_domain_name
# # }

# Retrieve ACR admin credentials using outputs from azurerm_container_registry
# output "acr_admin_username" {
#   value     = azurerm_container_registry.acr.admin_username
#   sensitive = false
# }

# output "acr_admin_password" {
#   value     = azurerm_container_registry.acr.admin_password
#   sensitive = true
# }