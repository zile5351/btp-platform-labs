terraform {
  required_providers {
    btp = {
      source  = "SAP/btp"
      version = ">= 1.27.0"
    }
  }

  cloud {
    organization = "zile-btp-labs"

    workspaces {
      name = "btp-labs-dev"
    }
  }
}

provider "btp" {
  globalaccount = var.globalaccount
}
