locals {
  qty_plus_1 = var.qty + 1
  constant   = "can only be changed by modifying terraform code"
  secret     = "sensetive value should never be hardcoded like this"
  # this variable is a string, but it will be automatically type cast into a number
  type_casting          = "2"
  qty_plus_type_casting = var.qty + local.type_casting
}
