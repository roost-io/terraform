# terraform {
#   backend "s3" {
#     bucket = "eaas-demo-terraform-states"
#     key = "roost-io-terraform-eks"
#     region = "ap-south-1"
#   }
# }

provider aws{
  region = var.region
}
provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}
