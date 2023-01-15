variable "bad_practice" {
  # this variable is defined without a description or a type constraint
  default = 1
}

variable "name" {
  description = "(optional) Name to use for the server"
  type        = any
  default     = null
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
