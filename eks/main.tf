module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.24.0"

  cluster_name    = (var.cluster_name == "") ? format("roost-eaas-terraform-cluster-%s",tostring(timestamp())) : var.cluster_name
  cluster_version = "1.22"

  cluster_endpoint_private_access = false
  cluster_security_group_id = aws_security_group.eks_security_group.id
  vpc_id     = aws_default_vpc.default.id
  subnets = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id]

  node_groups_defaults = {
    ami_type                               = "AL2_x86_64"
    instance_type                          = var.instance_type
    update_launch_template_default_version = true

    iam_role_additional_policies = [
      "arn:aws:iam:::role/EKSWorkerNodeRole"
    ]
  }
  enable_irsa = false
  write_kubeconfig = true
  kubeconfig_output_path = (var.ROOST_APP_NAME != "" && var.ROOST_ENV_ID != "" ) ? format("/var/tmp/Roost/%s/%s/cluster/config", var.ROOST_APP_NAME, var.ROOST_ENV_ID) : "kubeconfig/config"
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}