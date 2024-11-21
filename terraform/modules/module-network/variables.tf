variable "vpc_id" {
  type        = string
  description = "VPC to use"
  default     = "vpc-0fb4c3c47b69b97fa"
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {
    Name = "subnet-for-ec2" 
    resource-type = "subnet"
  }
}

variable "subnet_number" {
  type        = string
  description = "Subnet to use"
  default     = "10.0.4.0/24"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone of the subnet"
  default     = "ap-southeast-1a"
}

variable "assign_public_ipv4" {
  type        = bool
  description = "Whether to use public IPv4 addresses"
  default     = false
}