module "resource_group" {
    source = "../../module/azurerm_rg"
    x=var.resource_group
  
}
module "virtual_network" {
    depends_on = [ module.resource_group ]
    source = "../../module/azurm_vnet"
    x=var.virtual_network
  
}
module "subnet" {
    depends_on = [ module.virtual_network]
    source="../../module/azurerm_subnet"
    x=var.subnet
}
module "bastionsubnet" {
    depends_on = [ module.virtual_network ,module.publicip]
    source = "../../module/azurerm_bastion"
    x = var.azurebastion
}
module "publicip" {
    depends_on = [ module.resource_group ]
    source = "../../module/azurerm_publicip"
    x=var.publicip
  
}
module "virtualmachine" {
    depends_on = [ module.subnet ]
    source = "../../module/azurerm_virtual_machine"
    x = var.virtualmachine
  
}