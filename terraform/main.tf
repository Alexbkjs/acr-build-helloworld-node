provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
}

resource "azurerm_container_group" "container" {
  name                = var.container_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"

  container {
    name   = var.container_name
    image  = "${azurerm_container_registry.acr.login_server}/${var.image_name}:latest"
    cpu    = "0.5"
    memory = "1.5"
  }
}
