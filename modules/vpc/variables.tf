variable "region" {
  description = "The AWS region to create the VPC in."
  type        = string
  default     = "us-east-1"  # Replace with your desired region
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "A list of availability zones to choose from for the subnet."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "subnet_cidr" {
  description = "The CIDR block for the main subnet."
  type        = string
  default     = "10.0.1.0/24"  # Replace with your desired CIDR block
}
