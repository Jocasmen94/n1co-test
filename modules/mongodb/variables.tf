variable "vpc_id" {
  description = "The ID of the VPC to deploy the MongoDB instance in."
  type        = string
}

variable "instance_type" {
  description = "The instance type for the MongoDB instance."
  type        = string
  default     = "t4g.nano"  # Example default, adjust as needed
}

variable "mongodb_ami" {
  description = "The AMI ID for the MongoDB instance (Ubuntu 20.04 example)."
  type        = string
  default     = "ami-05d47d29a4c2d19e1"  # Adjust as needed
}
