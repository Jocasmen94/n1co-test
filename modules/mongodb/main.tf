resource "aws_subnet" "mongodb_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.8.0/24"  # Adjust as needed
  availability_zone = "us-east-1a"   # Example, adjust as needed

  # ... (other subnet configuration)
}

resource "aws_security_group" "mongodb_security_group" {
  name        = "mongodb_security_group"
  vpc_id      = var.vpc_id

  # ... (define inbound and outbound rules for MongoDB access)

  tags = {
    Name = "MongoDB_Security_Group"
  }
}

resource "aws_instance" "mongodb_instance" {
  ami           = var.mongodb_ami  # Reference the variable for AMI
  instance_type = var.instance_type  # Reference the variable for instance type

  subnet_id              = aws_subnet.mongodb_subnet.id
  vpc_security_group_ids = [aws_security_group.mongodb_security_group.id]

    associate_public_ip_address = true  # This line assigns a public IP

  # ... (other instance configuration)

  # Bootstrap script for MongoDB installation
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y mongodb
    # ... (other MongoDB configuration steps)
  EOF
}
