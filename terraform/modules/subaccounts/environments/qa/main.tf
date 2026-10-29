module "subaccount" {
  source = "../../"

  name      = "${var.project}-${var.env}"
  subdomain = "${var.project}-${var.env}-${var.suffix}"
  region    = var.region
  cfname    = "${var.project}-${var.env}-cf"
  labels = {
    "managed-by"  = ["terraform"]
    "environment" = [var.env]
  }
  group_role_assignments = {
    admins = {
      role_collection = "Subaccount Administrator"
      group           = "btp-${var.env}-admins"
    }

    viewers = {
      role_collection = "Subaccount Viewer"
      group           = "btp-${var.env}-viewers"
    }
  }
}
