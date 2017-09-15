module "default_label" {
  source     = "git::https://github.com/cloudposse/tf_label.git?ref=tags/0.2.0"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  name       = "${var.name}"
  delimiter  = "${var.delimiter}"
  attributes = "${var.attributes}"
  tags       = "${var.tags}"
}

resource "aws_s3_bucket" "default" {
  bucket        = "${module.default_label.id}"
  acl           = "${var.acl}"
  region        = "${var.region}"
  force_destroy = "${var.force_destroy}"
  policy        = "${var.policy}"

  versioning {
    enabled = "${var.versioning_enabled}"
  }

  noncurrent_version_expiration {
    days = "${var.noncurrent_version_expiration_days}"
  }

  noncurrent_version_transition {
    days          = "${var.noncurrent_version_transition_days}"
    storage_class = "GLACIER"
  }

  lifecycle_rule {
    id      = "${module.default_label.id}"
    enabled = true

    prefix = "${var.prefix}"
    tags   = "${module.default_label.tags}"

    transition {
      days          = "${var.standard_transition_days}"
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = "${var.glacier_transition_days}"
      storage_class = "GLACIER"
    }

    expiration {
      days = "${var.expiration_days}"
    }
  }
}
