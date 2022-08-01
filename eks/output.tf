
output "kubeconfigfile" {
    value = module.eks.kubeconfig_filename
  
}
output "kubecoonfig" {
  value = module.eks.kubeconfig
}