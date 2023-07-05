# Módulo de Terraform para la creación de un balanceado de carga público o privado en Azure

Módulo de Terraform para proporcionar balanceador de carga en Azure con las siguientes características:

- Capacidad para especificar un balanceador de carga ```public``` o ```private``` usando: ```var.type```. El valor predeterminado es ```public```.
- Especifica la subred que se utilizará para equilibradores de carga: ```frontend_subnet_id```
- Para el equilibrador de carga ```private```, especifica la dirección IP privada utilizando ```frontend_private_ip_address```
- Especifica el tipo de dirección IP privada con ```frontend_private_ip_address_allocation```, dinámica o estática, el valor predeterminado es ```Dynamic```

## Plantilla

main.tf

```
# Variables lb
variable "resource_group_name" {}
variable "type" {}
variable "name_lb" {}
variable "frontend_name" {}
variable "frontend_subnet_id" {}
variable "frontend_private_ip_address_allocation" {}
variable "frontend_private_ip_address" {}
variable "lb_sku" {}
variable "location" {}


module "mylb" {
  source                                 = "git@github.com:ragalgut/az-tf-module-load-balancer.git"

  type                                   = var.type
  name_lb                                = var.name_lb
  resource_group_name                    = var.resource_group_name
  frontend_name                          = var.frontend_name
  frontend_subnet_id                     = var.frontend_subnet_id
  frontend_private_ip_address_allocation = var.frontend_private_ip_address_allocation
  frontend_private_ip_address            = var.frontend_private_ip_address
  lb_sku                                 = var.lb_sku
  location                               = var.location

  tags = var.tags
}
```

## Despliegue