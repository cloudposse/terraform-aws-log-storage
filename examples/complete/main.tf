provider "aws" {
  region = var.region
}

module "s3_log_storage" {
  source  = "../../"
  enabled = var.enabled

  namespace     = var.namespace
  stage         = var.stage
  name          = var.name
  force_destroy = true
}
