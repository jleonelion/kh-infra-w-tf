variable "app_abbrev" {
  description = "Abbreviation to identify the application or system to which the infrastructure is related"
  type        = string
}

variable "environment" {
  description = "Single character description of the environment"
  type        = string

  validation {
    condition     = contains(["d", "q", "s", "p"], var.environment)
    error_message = "Value must be be: d, q, s, or p"
  }
}

variable "region" {
  description = "AWS region that resource resides in"
  type        = string

  # could add validation here, but omitting for brevity
}

variable "type" {
  description = "The type of resource the name is being generated for"
  type        = string

  # could add validation here, but omitting for brevity
}

variable "name" {
  description = "Descriptive name of the resource"
  type        = string

  # could add validation here, but omitting for brevity
}
