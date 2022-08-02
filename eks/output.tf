
output "kubeconfigfile" {
    value = module.eks.kubeconfig_filename
  
}
output "kubeconfig" {
  value = module.eks.kubeconfig
}

output "eks_endpoint"{
  value = module.eks.cluster_endpoint
}