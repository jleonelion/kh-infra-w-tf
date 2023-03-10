# s3 bucket will hold the actual state file
resource "aws_s3_bucket" "tf_remote_state" {

  # if this was realy, we would add this meta-data attribute to prevent accidental delete
  lifecycle {
    prevent_destroy = true
  }
}
# good practice to version the statefile...just in case rollback is required
resource "aws_s3_bucket_versioning" "statefile_versioning" {
  bucket = aws_s3_bucket.tf_remote_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
# since s3 does not support file locking, we need to have a dynamodb table
resource "aws_dynamodb_table" "tf_remote_state_locking" {
  hash_key = "LockID"
  name     = "tf-s3-backend-locking"
  attribute {
    name = "LockID"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
}
