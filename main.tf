resource "azurerm_public_ip" "azlb" {
  count = var.type == "public" ? 1 : 0

  allocation_method       = var.allocation_method
  location                = var.location
  name                    = var.pip_name
  resource_group_name     = var.resource_group_name
  ddos_protection_mode    = var.pip_ddos_protection_mode
  ddos_protection_plan_id = var.pip_ddos_protection_plan_id
  domain_name_label       = var.pip_domain_name_label
  edge_zone               = var.edge_zone
  idle_timeout_in_minutes = var.pip_idle_timeout_in_minutes
  ip_tags                 = var.pip_ip_tags
  ip_version              = var.pip_ip_version
  public_ip_prefix_id     = var.pip_public_ip_prefix_id
  reverse_fqdn            = var.pip_reverse_fqdn
  sku                     = var.pip_sku
  sku_tier                = var.pip_sku_tier
  tags                    = var.tags
  zones = var.pip_zones
}

resource "azurerm_lb" "azlb" {
  location            = var.location
  name                = var.name_lb
  resource_group_name = var.resource_group_name
  edge_zone           = var.edge_zone
  sku                 = var.lb_sku
  sku_tier            = var.lb_sku_tier
  tags = var.tags

  frontend_ip_configuration {
    name                          = var.frontend_name
    private_ip_address            = var.frontend_private_ip_address
    private_ip_address_allocation = var.frontend_private_ip_address_allocation
    private_ip_address_version    = var.frontend_private_ip_address_version
    public_ip_address_id          = try(azurerm_public_ip.azlb[0].id, null)
    subnet_id                     = var.frontend_subnet_id
  }

  lifecycle {
    precondition {
      condition     = var.frontend_subnet_name == null || var.frontend_subnet_name == "" || var.frontend_subnet_id == null || var.frontend_subnet_id == ""
      error_message = "frontend_subnet_name or frontend_vent_name cannot exist if frontend_subnet_id exists."
    }
  }
}