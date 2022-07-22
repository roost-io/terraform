terraform {
  backend "s3" {
    bucket = "eaas-demo-terraform-states"
    key = "roost-io-terraform"
    region = "ap-south-1"
  }
}