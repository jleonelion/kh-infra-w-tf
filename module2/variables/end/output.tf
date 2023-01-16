output "bad_practice" {
  value = var.bad_practice
}

output "name" {
  value     = var.name
  sensitive = false
}

output "instance_type" {
  value     = var.instance_type
  sensitive = false
}

output "qty" {
  value     = var.qty
  sensitive = false
}

output "string_list" {
  value     = var.string_list
  sensitive = false
}

output "vpc_config" {
  value     = var.vpc_config
  sensitive = false
}

output "qty_plus_1" {
  value     = local.qty_plus_1
  sensitive = false
}

output "constant" {
  value     = local.constant
  sensitive = false
}

output "secret" {
  value     = local.secret
  sensitive = true
}

output "qty_plus_type_casting" {
  value     = local.qty_plus_type_casting
  sensitive = false
}
