resource "azurerm_resource_group" "main" {
  name     = "ezaznet"
  location = "westeurope"
}

resource "azurerm_virtual_network" "hub-vnet" {
  name                = "hub-vnet"
  address_space       = [var.address_space[0]]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}
resource "azurerm_subnet" "hub-subnet-bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.hub-vnet.name
  address_prefixes     = [cidrsubnet(azurerm_virtual_network.hub-vnet.address_space[0], 8, 0)]
}
resource "azurerm_public_ip" "bastion-ip" {
  name                = "bastion-ip"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = {
    environment = "dev"
  }
}


resource "azurerm_bastion_host" "name" {
  name                = "bastion"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  ip_configuration {
    name                 = "bastion-ip"
    subnet_id            = azurerm_subnet.hub-subnet-bastion.id
    public_ip_address_id = azurerm_public_ip.bastion-ip.id
  }
}
