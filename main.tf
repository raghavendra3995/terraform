provider "aws" {
  region     = "us-west2"
  access_key = abc
  secret_key = acs
}

resource "aws_vpc" "development-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    "name" = "development"
  }
}

resource "aws_subnet" "devsubnet" {
  vpc_id            = aws_vpc.development-vpc.id
  ccidr_block       = var.subnet_cidr_block
  availability_zone = "us-west"
  tags = {
    "name" = "dev-subnet"
  }

}

output "dev-vpcid" {
  value = "aws_vpc.development-vpc.id"
}

output "dev-subnetid" {
  value = "aws_subnet.devsubnet.id"
}
