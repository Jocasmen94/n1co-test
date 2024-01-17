# Creación de un grupo de seguridad para el RDS
resource "aws_subnet" "private_subnet_a" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.7.0/24"
  # ... (other subnet configuration)
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.6.0/24"
  # ... (other subnet configuration)
}


resource "aws_security_group" "rds_security_group" {
  name = "rds_security_group"
  vpc_id = var.vpc_id

  # Define las reglas de seguridad necesarias para el RDS
  # ...

  tags = {
    Name = "RDS_Security_Group"
  }
}

resource "aws_db_subnet_group" "my_db_subnet_group" {
  name = "my_db_subnet_group"

  subnet_ids = [
    aws_subnet.private_subnet_a.id,
    aws_subnet.private_subnet_b.id,
  ]
}
# Creación de instancia de RDS en la misma VPC
resource "aws_db_instance" "my_rds_instance" {
  identifier          = "my-rds-instance"
  allocated_storage   = var.db_allocated_storage
  engine              = var.db_engine
  instance_class      = var.db_instance_class
  username            = var.db_username
  password            = var.db_password
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]
  db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name
  skip_final_snapshot = true

}
