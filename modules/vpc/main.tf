resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "my-vpc"
  }

  instance_tenancy = "default"
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr  # Replace with your desired CIDR block
  availability_zone       = var.availability_zones[0]  # Choose an AZ
  map_public_ip_on_launch = true  # Optional, adjust as needed

  tags = {
    Name = "my-vpc-main-subnet"
  }
}
