provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "TestInstance-01" {
    ami             = "ami-084568db4383264d4"
    instance_type   = "t2.micro"
    subnet_id       = "subnet-04cc49f127f01874e"
}

resource "aws_s3_bucket" "terraformstate" {
    bucket = "terraformstate"
    //region = "us-east-1"
    
}
