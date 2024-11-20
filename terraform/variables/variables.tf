variable "associate_public_ip_address" {
  type        = string
  description = "Attach a public IPv4 address"
  default     = "false"
}

variable "tags" {
  type        = map(string)
  description = "Instance specific tags"
  default = {
    name = "generic-server"
  }
}