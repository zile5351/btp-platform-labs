module "subaccount" {
  source = "./modules/subaccounts"

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

moved {
  from = btp_subaccount.this
  to   = module.subaccount.btp_subaccount.this
}

moved {
  from = btp_subaccount_entitlement.cf_runtime
  to   = module.subaccount.btp_subaccount_entitlement.cf_runtime
}

moved {
  from = btp_subaccount_environment_instance.cf
  to   = module.subaccount.btp_subaccount_environment_instance.cf
}

moved {
  from = btp_subaccount_role_collection_assignment.admin
  to   = module.subaccount.btp_subaccount_role_collection_assignment.admin
}
