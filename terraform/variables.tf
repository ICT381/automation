variable "aws_access_key_id" {
  type    = string
  default = "PLACEHOLDER"
}

variable "aws_secret_access_key" {
  type    = string
  default = "PLACEHOLDER"
}

variable "aws_session_token" {
  type    = string
  default = "PLACEHOLDER"
}

variable "source_ip_block" {
  default = "0.0.0.0/0"
  type    = string
  validation {
    condition     = can(cidrnetmask(var.source_ip_block))
    error_message = "Must be a valid IPv4 CIDR block address."
  }
}

variable "group" {
  default     = "jenkins"
  description = "the name of the group we will be using for Ansible purposes"
}

variable "name" {
  default     = "jenkins"
  description = "the name of the instance we will be using for Ansible purposes"
}
