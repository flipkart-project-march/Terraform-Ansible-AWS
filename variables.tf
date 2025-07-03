variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "key_name" {
  description = "name of the pem file"
  type        = string
  default     = "terraform_ansible"
}
