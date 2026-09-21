# VPC

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}


# Public Subnets

output "public_subnet_ids" {
  description = "IDs of public subnets"
  value = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id,
    aws_subnet.public_c.id
  ]
}


# EKS Private Subnets

output "eks_private_subnet_ids" {
  description = "IDs of EKS private subnets"
  value = [
    aws_subnet.eks_private_a.id,
    aws_subnet.eks_private_b.id,
    aws_subnet.eks_private_c.id
  ]
}


# DB Private Subnets

output "db_private_subnet_ids" {
  description = "IDs of DB private subnets"
  value = [
    aws_subnet.db_private_a.id,
    aws_subnet.db_private_b.id,
    aws_subnet.db_private_c.id
  ]
}


# Internet Gateway

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.main.id
}


# NAT Gateways

output "nat_gateway_ids" {
  description = "IDs of NAT Gateways"
  value = [
    aws_nat_gateway.nat_a.id,
    aws_nat_gateway.nat_b.id,
    aws_nat_gateway.nat_c.id
  ]
}


# Route Tables

output "public_route_table_id" {
  description = "ID of public route table"
  value       = aws_route_table.public.id
}

output "eks_private_route_table_ids" {
  description = "IDs of EKS private route tables"
  value = [
    aws_route_table.eks_private_a.id,
    aws_route_table.eks_private_b.id,
    aws_route_table.eks_private_c.id
  ]
}

output "db_private_route_table_id" {
  description = "ID of DB private route table"
  value       = aws_route_table.db_private.id
}
