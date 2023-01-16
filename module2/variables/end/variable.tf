variable "bad_practice" {
  # this variable is defined without a description or a type constraint
  default = 1
}

variable "name" {
  description = "(optional) Name to use for the server"
  type        = any
  default     = null
}

variable "string_list" {
  description = "(optional) List of strings"
  type        = list(string)
  default     = ["string1", "string2"]
}

variable "instance_type" {
  description = "(optional) Instance type of the server"
  type        = string
  default     = "t2.micro"
}

variable "qty" {
  description = "(optional) Number of servers to create"
  type        = number
  default     = 0
}

variable "vpc_config" {
  description = "(optional) object structure describing vpc to create"
  type = object({
    name = string
    cidr = optional(string, "10.0.0.0/16")
    subnets = optional(object({
      public  = optional(string, "10.0.0.0/24")
      private = optional(string, "10.0.1.0/24")
    }), {})
  })
  default = {
    name = "myvpc"
  }
  validation {
    # regex attributable to: https://regex101.com/r/4F4Jxl/1
    condition     = can(regex("^(10(\\.(([0-9]?[0-9])|(1[0-9]?[0-9])|(2[0-4]?[0-9])|(25[0-5]))){3}/([8-9]|(1[0-9])|(2[0-9])|(3[0-1])))|(172\\.((1[6-9])|(2[0-9])(3[0-1]))(\\.(([0-9]?[0-9])|(1[0-9]?[0-9])|(2[0-4]?[0-9])|(25[0-5]))){2}/((1[2-9])|(2[0-9])|(3[0-1])))|(192\\.168(\\.(([0-9]?[0-9])|(1[0-9]?[0-9])|(2[0-4]?[0-9])|(25[0-5]))){2}/((1[6-9])|(2[0-9])|(3[0-1])))|(127(\\.(([0-9]?[0-9])|(1[0-9]?[0-9])|(2[0-4]?[0-9])|(25[0-5]))){3}/([8-9]|(1[0-9])|(2[0-9])|(3[0-1])))", var.vpc_config.cidr))
    error_message = "VPC CIDR must be a valid IPv4 CIDR in private address range per RFC https://tools.ietf.org/html/rfc1918."
  }
}
