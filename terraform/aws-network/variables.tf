variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}
variable "db_password" {
  description = "RDS PostgreSQL master password"
  type        = string
  sensitive   = true
}
