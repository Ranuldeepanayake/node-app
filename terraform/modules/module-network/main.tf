resource "aws_subnet" "subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_number

  assign_ipv6_address_on_creation = false
  map_public_ip_on_launch = var.assign_public_ipv4
  #enable_dns64 = true
  enable_resource_name_dns_a_record_on_launch = true
  #enable_resource_name_dns_aaaa_record_on_launch = true
  #ipv6_native = true
  #ipv6_cidr_block = 

  tags = var.tags
}

# resource "aws_route_table_association" "route_table_association" {
#   subnet_id      = aws_subnet.foo.id
#   route_table_id = aws_route_table.bar.id
# }