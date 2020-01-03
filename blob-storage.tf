resource "azurerm_storage_account" "main" {
  name                     = "${var.blob-name}"
  resource_group_name      = "${data.azurerm_resource_group.main.name}"
  location                 = "${data.azurerm_resource_group.main.location}"
  account_tier             = "${var.account-tier}"
  account_replication_type = "${var.account-replication-type}"
  account_kind             = "${var.account-kind}"

  network_rules {
    default_action             = "${var.default-action}"
    virtual_network_subnet_ids = ["${data.azurerm_subnet.main.id}"]
  }

  tags = {
                applicationname         =   "Walmart(Converted to EA)"
                costcenter              =   "${var.cost-center}"
                deploymenttype          =   "Terraform"
                environmentinfo         =   "${var.environment}"
                notificationdistlist    =   "${var.notificationdistlist}"
                ownerinfo               =   "${var.owner-info}"
                sponsorinfo             =   "${var.sponsor-info}"
            }
}
resource "azurerm_management_lock" "main" {
  name       = "${var.blob-name}"
  scope      = "${azurerm_storage_account.main.id}"
  lock_level = "CanNotDelete"
  notes      = "Bloqueado para prevenir accidentes de borrado"
}

resource "azurerm_storage_container" "main" {
  name                  = "${var.blob-name}"
  resource_group_name   = "${data.azurerm_resource_group.main.name}"
  storage_account_name  = "${azurerm_storage_account.main.name}"
  container_access_type = "${var.container-access-type}"
}

resource "azurerm_storage_blob" "main" {
  name                   = "${var.blob-name}"
  resource_group_name    = "${data.azurerm_resource_group.main.name}"
  storage_account_name   = "${azurerm_storage_account.main.name}"
  storage_container_name = "${azurerm_storage_container.main.name}"
  type                   = "${var.storage-blob-type}"
}