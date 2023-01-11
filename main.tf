data "azuread_client_config" "current" {}

// create groups
resource "azuread_group" "main" {
  for_each         = var.user_role_map
  display_name     = "${var.base_name}_${each.value.name}"
  owners           = var.owner == null ? [data.azuread_client_config.current.object_id] : var.owner
  security_enabled = true
}


resource "azurerm_role_assignment" "main" {
  for_each             = var.user_role_map
  scope                = var.assign_id
  role_definition_name = each.value.role
  principal_id         = azuread_group.main["${each.key}"].id
}
