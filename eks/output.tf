output "kubeconfig"{
    value = module.eks.cluster_certificate_authority_data[0].kubeconfig
}

output "eks_endpoint"{
    value = module.eks.cluster_endpoint
}