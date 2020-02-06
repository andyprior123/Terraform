# create public zone and a record node1.budhoney.co.uk

provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.38.0"
}

resource "azurerm_resource_group" "example" {
  name     = "budhoney"
  location = "UK West"
}

resource "azurerm_dns_zone" "example-public" {
  name                = "budhoney.co.uk"
  resource_group_name = "${azurerm_resource_group.example.name}"
  zone_type           = "Public"
}

resource "azurerm_dns_a_record" "example" {
  name                = "node1"
  zone_name           = "${azurerm_dns_zone.example.name}"
  resource_group_name = "${azurerm_resource_group.example.name}"
  ttl                 = 300
  records             = ["8.8.8.8"]
}
