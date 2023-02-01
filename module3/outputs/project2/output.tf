output "remote_connection_string" {
  value     = data.terraform_remote_state.project1.outputs.connection_string
  # not a good idea to make what was a sensetive output no longer sensetive
  sensitive = false
}

output "remote_hostname" {
  value     = data.terraform_remote_state.project1.outputs.hostname
  sensitive = false
}
