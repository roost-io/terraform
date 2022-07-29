
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "terraform-eaas-test"
  acl    = "public-read"

  # Allow deletion of non-empty bucket
  force_destroy = true
  versioning = {
    enabled = true
  }

}

resource "aws_s3_object" "eaas" {
  bucket = module.s3_bucket.s3_bucket_id
  key = "${var.eaas_app_name}/${var.eaas_namespace}/"
}
