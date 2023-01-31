output "result" {
  value = "${local.app_abbrev}${local.name}${local.environment}${local.region}${local.type}${random_string.random.result}"
}
