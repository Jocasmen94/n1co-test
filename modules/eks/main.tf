resource "aws_iam_role" "eks_role" {
  name               = "eks-cluster-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_role.name
}

resource "aws_iam_role_policy_attachment" "eks_service_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.eks_role.name
}

resource "aws_subnet" "eks_subnet1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_1  # Assuming you have a variable for each subnet CIDR
  availability_zone = var.availability_zone_1  # Specify a different AZ here
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = "my-eks-subnet1"
  }
}

resource "aws_subnet" "eks_subnet2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_2  # Assuming you have a variable for each subnet CIDR
  availability_zone = var.availability_zone_2  # Specify a different AZ here
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = "my-eks-subnet2"
  }
}

resource "aws_eks_cluster" "eks" {
  name       = var.cluster_name
  role_arn   = var.role_arn
  vpc_config {
    subnet_ids = [aws_subnet.eks_subnet1.id, aws_subnet.eks_subnet2.id]  # Reference both subnet IDs
  }
}