module "subaccount" {
  source = "./modules/subaccounts"

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

  entitlements = {
    destination-lite = {
      service_name = "destination"
      plan_name    = "lite"
    }
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

import {
  to = module.subaccount.btp_subaccount_entitlement.additional["destination-lite"]
  id = "${module.subaccount.subaccount_id},destination,lite"
}

