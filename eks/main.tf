module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "18.26.6"

  cluster_name    = "terrafrom-eks-test"
  cluster_version = "1.22"

  cluster_endpoint_private_access = false

  vpc_id     = aws_default_vpc.default.id
  subnet_ids = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id]

  self_managed_node_group_defaults = {
    ami_type                               = "AL2_x86_64"
    instance_type                          = "t3.medium"
    update_launch_template_default_version = true

    iam_role_additional_policies = [
      "arn:aws:iam:::role/EKSWorkerNodeRole"
    ]
  }
  create_cloudwatch_log_group = false
}
