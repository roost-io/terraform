module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "18.26.6"

  cluster_name    = "terrafrom-eks-test"
  cluster_version = "1.22"

  # cluster_endpoint_private_access = true

  vpc_id     = aws_default_vpc.eks_vpc.id    
  subnet_ids = [aws_default_subnet.eks_subnet_a.id,aws_default_subnet.eks_subnet_b.id]

  eks_managed_node_group_defaults = {
    disk_size      = 20
    instance_types = ["t2.medium", "t2.medium"]
  }
  create_cloudwatch_log_group = false
}
