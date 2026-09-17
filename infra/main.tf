resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = var.environment
    managed_by  = "omni-tech-devops-library"
  }
}

resource "azurerm_storage_account" "example" {
  # checkov:skip=CKV2_AZURE_33: Private endpoint requires a dedicated VNet/subnet, out of scope for this assignment's demo resource.
  # checkov:skip=CKV2_AZURE_1: Customer-managed key encryption requires a Key Vault dependency, out of scope for this assignment's demo resource; platform-managed encryption plus TLS1.2 and disabled shared-key auth are applied instead.
  # checkov:skip=CKV_AZURE_33: Classic Storage Analytics queue logging is being deprecated by Microsoft in favor of Diagnostic Settings/Azure Monitor; not configured for this demo resource.
  name                     = "stprojectalpha${var.environment}"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  min_tls_version                 = "TLS1_2"
  public_network_access_enabled   = false
  allow_nested_items_to_be_public = false
  shared_access_key_enabled       = false

  blob_properties {
    delete_retention_policy {
      days = 7
    }
  }

  sas_policy {
    expiration_period = "01.00:00:00"
  }

  tags = {
    environment = var.environment
  }
}