resource "azurerm_resource_group" "tfsangu" {
  name     = "vntier"
  location = "centralindia"

}

resource "azurerm_virtual_network" "primary" {
  name                = "vntier-primary"
  resource_group_name = azurerm_resource_group.tfsangu.name
  location            = "centralindia"
  address_space       = ["10.100.0.0/16"]

}

resource "azurerm_subnet" "web" {
  name                 = "web"
  resource_group_name  = azurerm_resource_group.tfsangu.name
  virtual_network_name = "vntier-primary"
  address_prefixes     = ["10.100.0.0/24"]

}
resource "azurerm_subnet" "business" {
  name                 = "business"
  resource_group_name  = azurerm_resource_group.tfsangu.name
  virtual_network_name = "vntier-primary"
  address_prefixes     = ["10.100.1.0/24"]
}


resource "azurerm_subnet" "data" {
  name                 = "data"
  resource_group_name  = azurerm_resource_group.tfsangu.name
  virtual_network_name = "vntier-primary"
  address_prefixes     = ["10.100.2.0/24"]
  depends_on           = [azurerm_resource_group.tfsangu]
}