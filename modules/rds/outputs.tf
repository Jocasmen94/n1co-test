# modules/rds/outputs.tf

output "db_instance_id" {
  value = aws_db_instance.my_rds_instance.id
}

output "db_endpoint" {
  value = aws_db_instance.my_rds_instance.endpoint
}

output "db_username" {
  value = aws_db_instance.my_rds_instance.username
}

output "db_password" {
  value = aws_db_instance.my_rds_instance.password
  sensitive = true
}
