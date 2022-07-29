output "cluster_certificate_authority_data"{
    value = module.eks.cluster_certificate_authority_data
}

output "eks_endpoint"{
    value = module.eks.cluster_endpoint
}