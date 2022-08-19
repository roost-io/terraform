variable "cluster_name" {
  type = string
  default = "Public_EKS"
}
variable "availability_zones" {
  description = "Provide more than one availabiltiy zones in list type format seperated by commas(,), where subnets are located. "
  type = list
  default = ["ap-south-1b", "ap-south-1c", "ap-south-1a"]
}

variable "ROOST_APP_NAME" {
  description = "Roost EaaS application name. Roost provides the value by setting up ROOST_APP_NAME as environment variable"
  type = string
  default = ""
}

variable "ROOST_ENV_ID" {
  description = "Roost EaaS event trigger ID. Roost provides the value by setting up ROOST_ENV_ID as environment variable"
  type = string
  default = ""
}