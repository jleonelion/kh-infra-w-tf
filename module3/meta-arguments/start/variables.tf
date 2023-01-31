variable "prefix" {
  description = "Prefix to use for all resource names"
  type        = string
  default     = "iaas"
}
variable "server_instance_type" {
  description = "Instance type for the servers"
  type        = string
  default     = "t2.micro"
}
variable "region" {
  description = "AWS region to deploy resources to"
  type        = string
  default     = "us-west-1"
}

variable "subnet1_zone" {
  description = "Zone within the AWS region that first public subnet should be placed in"
  type        = string
  default     = "a"
}

variable "subnet2_zone" {
  description = "Zone within the AWS region that second public subnet should be placed in"
  type        = string
  default     = "c"
}

variable "environment" {
  description = "Identifies the environment being created"
  type        = string
  default     = "d"
}
