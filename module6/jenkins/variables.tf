variable "instance_type" {
  default = "t2.small"
}
variable "profile_name" {
  default = "default"
}
variable "instance_key" {
  default = "install"
}
variable "vpc_cidr" {
  default = "10.0.0.0/24"
}
variable "public_subnet_cidr" {
  default = "10.0.10.0/25"
}

variable "region" {
  description = "AWS region to deploy resources to"
  type        = string
  default     = "us-west-2"
}

variable "subnet_zone" {
  description = "Zone within the AWS region that first public subnet should be placed in"
  type        = string
  default     = "a"
}

