terraform {
  # see https://developer.hashicorp.com/terraform/language/settings/backends/local
  backend "local" {
  }
  # see https://developer.hashicorp.com/terraform/language/settings/backends/s3
  # backend "s3" {
  #   # this needs to point to randomly generated bucket name
  #   bucket = "terraform-20230310050814904200000001"
  #   # this determines path within buck that state file will be stored
  #   key = "terraform/backend/bootstrap.tfstate"
  #   # points to the dynamo table created
  #   dynamodb_table = "tf-s3-backend-locking"
  #   # enable server side encryption of the state file
  #   encrypt = true
  # }
}
