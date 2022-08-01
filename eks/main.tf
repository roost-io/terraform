module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.24.0"

  cluster_name    = "terrafrom-eks-test"
  cluster_version = "1.22"

  cluster_endpoint_private_access = false
  vpc_id     = "vpc-a4dcc5cc"
  subnets = ["subnet-e70d0b8f","subnet-5747f92c","subnet-ffea9eb3"]
  node_groups_defaults = {
    ami_type                               = "AL2_x86_64"
    instance_type                          = "t3.medium"
    update_launch_template_default_version = true

    iam_role_additional_policies = [
      "arn:aws:iam:::role/EKSWorkerNodeRole"
    ]
  }
  enable_irsa = false
  write_kubeconfig = true
  kubeconfig_output_path = "kubeconfig/"
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

