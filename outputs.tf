output "azurerm_lb_frontend_ip_configuration" {
  description = "the frontend_ip_configuration for the azurerm_lb resource"
  value       = azurerm_lb.azlb.frontend_ip_configuration
}

output "azurerm_lb_id" {
  description = "the id for the azurerm_lb resource"
  value       = azurerm_lb.azlb.id
}


output "azurerm_public_ip_address" {
  description = "the ip address for the azurerm_lb_public_ip resource"
  value       = azurerm_public_ip.azlb[*].ip_address
}

output "azurerm_public_ip_id" {
  description = "the id for the azurerm_lb_public_ip resource"
  value       = azurerm_public_ip.azlb[*].id
}