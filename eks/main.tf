module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "18.26.6"

  cluster_name    = "terrafrom-eks-test"
  cluster_version = "1.22"

  cluster_endpoint_private_access = false

  # vpc_id     = aws_default_vpc.default.id
  # subnet_ids = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id]
  vpc_id     = "vpc-a4dcc5cc"
  subnet_ids = ["subnet-e70d0b8f","subnet-5747f92c","subnet-ffea9eb3"]

  # worker_groups = [
  #   {
  #     ami_type = "AL2_x86_64"
  #     instance_type = "t3.medium"
  #     asg_max_size  = 5
  #   }
  # ]
  self_managed_node_group_defaults = {
    ami_type                               = "AL2_x86_64"
    instance_type                          = "t3.medium"
    update_launch_template_default_version = true

    iam_role_additional_policies = [
      "arn:aws:iam:::role/EKSWorkerNodeRole"
    ]
  }
  enable_irsa = false
  enable_kms_key_rotation = false
  iam_role_use_name_prefix = false
  create_cloudwatch_log_group = false
  create_aws_auth_configmap = true
  # write_kubeconfig=true
  # config_output_path="~/var/tmp/Roost/.kube/"
}
