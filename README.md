# Módulo de Terraform para la creación de un balanceado de carga público o privado en Azure

Módulo de Terraform para proporcionar balanceador de carga en Azure con las siguientes características:

- Capacidad para especificar un balanceador de carga ```public``` o ```private``` usando: ```var.type```. El valor predeterminado es ```public```.
- Especifica la subred que se utilizará para equilibradores de carga: ```frontend_subnet_id```
- Para el equilibrador de carga ```private```, especifica la dirección IP privada utilizando ```frontend_private_ip_address```
- Especifica el tipo de dirección IP privada con ```frontend_private_ip_address_allocation```, dinámica o estática, el valor predeterminado es ```Dynamic```

## Plantilla

main.tf

```
module "mylb" {
  source                                 = "git@github.com:ragalgut/az-tf-module-load-balancer.git"

  type                                   = var.type
  frontend_subnet_id                     = var.frontend_subnet_id
  frontend_private_ip_address_allocation = var.frontend_private_ip_address_allocation
  frontend_private_ip_address            = var.frontend_private_ip_address
  lb_sku                                 = var.lb_sku
  location                               = var.location
  pip_sku                                = var.pip_sku
  name                                   = var.name_lb
  pip_name                               = var.pip_name

  remote_port = var.remote_port

  lb_port = var.lb_port

  lb_probe = var.lb_probe

  tags = var.tags

  depends_on = [azurerm_resource_group.test]
}
```

## Despliegue