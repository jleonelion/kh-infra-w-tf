output "connection_string" {
  value     = "jdbc://something"
  sensitive = true
}

output "hostname" {
  value     = "some.value.com"
  sensitive = false
}