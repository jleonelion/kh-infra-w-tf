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

variable "ip_address" {
  type        = string
  description = "Example of validating IP address"
  default     = "10.1.0.0"
  validation {
    condition     = can(regex("^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", var.ip_address))
    error_message = "Invalid IP address format"
  }
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
}
