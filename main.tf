terraform {
  backend "azurerm"{
    resource_group_name = "tfstaterg1"
    storage_account_name = "storagetfstate11"
    container_name = "appservice"
    key = "terraform.appservice"
    access_key = "mInNKN8F+6G7gHfFuyzCtyzEkcrdkW7TKKSwoH9mtO17xjW5125dt9VHYE1N3P1lT4/MxYgEOFhy+AStO2zhuA=="
  }
}
provider "azurerm" { 
    features {
      
    }
  subscription_id = var.subscription_id
  client_id = var.client_id
  tenant_id = var.tenant_id
  client_secret = var.client_secret
  
}
resource "azurerm_resource_group" "webapprg11" {
  name = "webapprg16"
  location = "East US"
  tags = {
    "name" = "practice-rsg1"
  }
  
}
resource "azurerm_app_service_plan" "testplan1" {
  name = "appplandev11"
  location = azurerm_resource_group.webapprg11.location
  resource_group_name = azurerm_resource_group.webapprg11.name
  sku {
    tier = "standard"
    size = "S1"
  }
  tags = {
    "name" = "practice-appplan"

  }
  depends_on = [
    azurerm_resource_group.webapprg11
  ]
  
}
resource "azurerm_app_service" "webapp11" {
  name = "webappdev"
  location = azurerm_resource_group.webapprg11.location
  resource_group_name = azurerm_resource_group.webapprg11.name
  app_service_plan_id = azurerm_app_service_plan.testplan1.id
  tags = {
    "name" = "practice-webapp"
  }
  depends_on = [
    azurerm_app_service_plan.testplan1
  ]
  
}