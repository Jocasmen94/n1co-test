variable "vpc_id" {
  description = "The ID of the VPC to create the EKS cluster in."
  type        = string
}

variable "subnet_cidr_1" {
  description = "The CIDR block for the first EKS subnet."
  type        = string
  default     = "10.0.2.0/24"  # Example default value
}

variable "availability_zone_1" {
  description = "The availability zone for the first EKS subnet."
  type        = string
  default     = "us-east-1a"   # Example default value
}

variable "subnet_cidr_2" {
  description = "The CIDR block for the second EKS subnet."
  type        = string
  default     = "10.0.3.0/24"  # Example default value
}

variable "availability_zone_2" {
  description = "The availability zone for the second EKS subnet."
  type        = string
  default     = "us-east-1b"   # Example default value
}

variable "map_public_ip_on_launch" {
  description = "Whether to assign public IPs to instances in the EKS subnets."
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "my-eks-cluster"  # Example default value
}

# Correctly referencing the role_arn created within the module:
variable "role_arn" {
  description = "The ARN of the IAM role for the EKS cluster."
  type        = string
}
