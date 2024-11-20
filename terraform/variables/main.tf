resource "aws_instance" "ec2" {
  ami                         = local.ami
  instance_type               = local.instance_type
  availability_zone           = local.availability_zone
  subnet_id                   = local.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = local.key_name
  get_password_data           = "false"

  tags = local.tags_all

  timeouts {
    create = local.timemout_create
    update = local.timemout_update
    delete = local.timemout_delete
  }
}

output "instance_id" {
  value = aws_instance.ec2.id
}

output "private_ip" {
  value = aws_instance.ec2.private_ip
}

output "private_dns" {
  value = aws_instance.ec2.private_dns
}

output "public_ip" {
  value = aws_instance.ec2.public_ip
}

output "public_dns" {
  value = aws_instance.ec2.public_dns
}

output "ipv6_addresses" {
  value = aws_instance.ec2.ipv6_addresses
}

output "availability_zone" {
  value = aws_instance.ec2.availability_zone
}



