variable "vpc_id" {
  description = "The ID of the VPC to create the RDS instance in."
  type        = string
}

# Other variables as needed
variable "db_name" {
  description = "The name of the RDS database."
  type        = string
  default     = "my-rds-db"
}

variable "db_username" {
  description = "The username for the RDS database."
  type        = string
  default     = "Jocasmen1994"
}

variable "db_password" {
  description = "The password for the RDS database."
  type        = string
  default     = "Atent0.2o24"
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance."
  type        = string
  default     = "db.t2.micro"
}

variable "db_allocated_storage" {
  description = "The amount of storage for the RDS instance."
  type        = number
  default     = 50
}

variable "db_engine" {
  description = "The database engine to use for the RDS instance."
  type        = string
  default     = "mysql"
}

