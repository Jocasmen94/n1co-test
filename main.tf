provider "aws" {
  region = "us-east-1"
}


module "vpc" {
  source = "./modules/vpc"

  # Pass any required input variables to the module (if applicable)
  # ...
}

# Outputting VPC and subnet IDs for reference:
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_id" {
  value = module.vpc.subnet_id
}

module "eks" {
  source = "./modules/eks"

  vpc_id          = module.vpc.vpc_id
  role_arn        = module.eks.role_arn  # Reference the output from the module
  # Other variables as needed
}

module "rds" {
  source = "./modules/rds"

  vpc_id = module.vpc.vpc_id

  # Other variables as needed (db_name, db_username, db_password, etc.)
}

# Outputting RDS instance details:
output "db_instance_id" {
  value = module.rds.db_instance_id
}

output "db_endpoint" {
  value = module.rds.db_endpoint
}

output "db_username" {
  value = module.rds.db_username
}

output "db_password" {
  value = module.rds.db_password
  sensitive = true
}


output "rds_db_instance_id" {
  value = module.rds.db_instance_id
}

output "rds_db_endpoint" {
  value = module.rds.db_endpoint
}

module "mongodb" {
  source = "./modules/mongodb"  # Assuming the module is in the `modules/mongodb` directory

  vpc_id = module.vpc.vpc_id  # Pass the VPC ID from the VPC module
  # Other variables as needed (e.g., instance type, AMI)
}

output "mongodb_instance_public_ip" {
  value = module.mongodb.mongodb_instance_public_ip
}

# Access other MongoDB module outputs as needed

module "ecr" {
  source = "./modules/ecr"  # Assuming the module is in the `modules/ecr` directory
  region = "us-east-1"
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}
