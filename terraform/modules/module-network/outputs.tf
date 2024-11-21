output "subnet_id" {
  value = aws_subnet.subnet.id
}

output "vpc_id" {
  value = aws_subnet.subnet.vpc_id
}

output "subnet_az" {
  value = aws_subnet.subnet.availability_zone
}

output "subnet_ipv6_assoc_id" {
  value = aws_subnet.subnet.ipv6_cidr_block_association_id
}