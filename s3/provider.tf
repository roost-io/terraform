terraform {
  backend "s3" {
    bucket = "eaas-demo-terraform-states"
    key = "roost-io-terraform-s3"
    region = "ap-south-1"
  }
}