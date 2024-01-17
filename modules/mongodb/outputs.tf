output "mongodb_instance_public_ip" {
  value = aws_instance.mongodb_instance.public_ip
}

# Add other outputs as needed (e.g., private IP, DNS name, etc.)
