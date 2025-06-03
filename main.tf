provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "testServer" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    key_name = var.key_name
}