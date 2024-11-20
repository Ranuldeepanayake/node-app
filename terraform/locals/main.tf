resource "aws_instance" "ec2" {
  ami               = local.ami
  instance_type     = local.instance_type
  availability_zone = local.availability_zone
  subnet_id         = local.subnet_id
  associate_public_ip_address = "false"
  key_name          = local.key_name
  get_password_data = "false"
  tags = {
    name          = "server-1"
    resource-type = "ec2"
  }
  timeouts {
    create = local.timemout_create
    update = local.timemout_update
    delete = local.timemout_delete
  }
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



