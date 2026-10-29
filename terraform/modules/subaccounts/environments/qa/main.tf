module "subaccount" {
  source = "../../"

  name        = "${var.project}-${var.env}"
  subdomain   = "${var.project}-${var.env}-${var.suffix}"
  region      = var.region
  admin_email = var.admin_email
  cfname      = "${var.project}-${var.env}-cf"
  labels = {
    "managed-by"  = ["terraform"]
    "environment" = [var.env]
  }
}
