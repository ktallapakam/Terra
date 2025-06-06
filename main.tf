provider "aws" {
  region = "us-east-1"
}

module "ec2instance" {
    source = "./modules/ec2instance"
    ami_value           = "ami-084568db4383264d4"
    instance_type       = "t2.micro"
    subnet_id           = "subnet-04cc49f127f01874e"
}

module "ec2instance1" {
    source = "./modules/ec2instance"
    ami_value           = "ami-084568db4383264d4"
    instance_type       = "t2.micro"
    subnet_id           = "subnet-04cc49f127f01874e"
} 