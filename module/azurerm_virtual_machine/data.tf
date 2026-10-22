data "azurerm_subnet" "subnets" {
    for_each = var.x
    virtual_network_name = each.value.virtual_network_name
    resource_group_name = each.value.resource_group_name
    name = each.value.subnet_name
  
}
data "azurerm_key_vault" "kvs" {
    name = "ankurkvs"
    resource_group_name = "ankur_rg"
  
}
data "azurerm_key_vault_secret" "username" {
    name = "vm-username"
    key_vault_id= data.azurerm_key_vault.kvs.id
}
data "azurerm_key_vault_secret" "password" {
    name = "vm-password"
    key_vault_id= data.azurerm_key_vault.kvs.id
}