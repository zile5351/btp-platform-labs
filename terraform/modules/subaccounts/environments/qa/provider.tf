terraform {
  cloud {
    organization = "zile-btp-labs"
    workspaces {
      name = "btp-labs-qa"
    }
  }

  required_providers {
    btp = {
      source = "SAP/btp"
    }
  }
}

provider "btp" {
  globalaccount = var.globalaccount
}
