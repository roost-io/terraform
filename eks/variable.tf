variable "cluster_name" {
  type = string
  default = "roost_eaas_terraform_cluster_010"
}
variable "availability_zones" {
  description = "Provide more than one availabiltiy zones in list type format seperated by commas(,), where subnets are located. "
  type = list
  default = ["ap-south-1b", "ap-south-1c", "ap-south-1a"]
}

variable "instance_type" {
  description = "Provide the required instance type for the cluster"
  type = string
  default = "t3.medium"
}