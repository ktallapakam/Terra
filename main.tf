provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "testServer-01" {
    ami             = "ami-084568db4383264d4"
    instance_type   = "t2.micro"
    subnet_id       = "subnet-04cc49f127f01874e"
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "my-terraform-state-bucket-123456"  # must be globally unique
  force_destroy = true
}


# DynamoDB table to hold the state lock
resource "aws_dynamodb_table" "tf_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
}

# --------------------------
# Setup remote backend config
# --------------------------
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-123456"  # Same as the bucket above
    key            = "env/dev/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}