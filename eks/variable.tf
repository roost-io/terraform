variable "cluster_name" {
  type = string
  default = "Public_EKS"
}
variable "availability_zones" {
  description = "Provide more than one availabiltiy zones in list type format seperated by commas(,), where subnets are located. "
  type = list
  default = ["ap-south-1b", "ap-south-1c", "ap-south-1a"]
}