provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "TestInstance-01" {
    ami             = "ami-084568db4383264d4"
    instance_type   = "t2.micro"
    subnet_id       = "subnet-04cc49f127f01874e"
}

terraform {
  backend "s3" {
    bucket       = "example-bucket"
    key          = "path/to/state"
    use_lockfile = true
    region       = "us-east-1"
  }
}

