data "aws_security_group" "selected" {
  id = "sg-001429f4b76c8906d"
}

resource "aws_instance" "ec2" {
  ami                         = local.ami
  instance_type               = local.instance_type
  availability_zone           = local.availability_zone
  subnet_id                   = "subnet-08675481f2991773d"
  associate_public_ip_address = var.associate_public_ip_address

  key_name          = local.key_name
  get_password_data = "false"

  vpc_security_group_ids = [data.aws_security_group.selected.id]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 10
    delete_on_termination = true
    encrypted             = false
  }

  timeouts {
    create = local.timemout_create
    update = local.timemout_update
    delete = local.timemout_delete
  }
}