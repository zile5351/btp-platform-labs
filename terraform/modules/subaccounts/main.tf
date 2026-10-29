resource "btp_subaccount" "this" {
  name      = var.name
  subdomain = var.subdomain
  region    = var.region
  labels    = var.labels
}

# Check the exact service and plan names on the cockpit's Entitlements page
resource "btp_subaccount_entitlement" "cf_runtime" {
  subaccount_id = btp_subaccount.this.id
  service_name  = "APPLICATION_RUNTIME"
  plan_name     = "MEMORY"
  amount        = 1
}

resource "btp_subaccount_environment_instance" "cf" {
  subaccount_id    = btp_subaccount.this.id
  name             = var.cfname
  environment_type = "cloudfoundry"
  service_name     = "cloudfoundry"
  plan_name        = "trial"
  parameters = jsonencode({
    instance_name = var.name
  })
  depends_on = [btp_subaccount_entitlement.cf_runtime]
}

resource "btp_subaccount_role_collection_assignment" "admin" {
  subaccount_id        = btp_subaccount.this.id
  role_collection_name = "Subaccount Administrator"
  user_name            = var.admin_email
  origin               = "sap.default"
}
