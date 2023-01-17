variable "prefix" {
  description = "Prefix to use for all resource names"
  default     = "iaas"
}
variable "server_instance_type" {
  description = "Instance type for the servers"
  default     = "t2.micro"
}
variable "region" {
  default = "us-west-1"
}

variable "subnet1_zone" {
  default = "a"
}

variable "subnet2_zone" {
  default = "c"
}
