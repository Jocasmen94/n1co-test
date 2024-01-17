output "cluster_id" {
  value = aws_eks_cluster.eks.id
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "subnet_ids" {
  value = [aws_subnet.eks_subnet1.id, aws_subnet.eks_subnet2.id]  # Output both subnet IDs
}

output "role_arn" {
  value = aws_iam_role.eks_role.arn
}
