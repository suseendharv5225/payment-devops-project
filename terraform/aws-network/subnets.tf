# -------------------------
# Public Subnets
# -------------------------

resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1b"

  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-b"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-south-1c"

  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-c"
  }
}


# -------------------------
# EKS Private Subnets
# -------------------------

resource "aws_subnet" "eks_private_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "eks-private-subnet-a"
  }
}

resource "aws_subnet" "eks_private_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "eks-private-subnet-b"
  }
}

resource "aws_subnet" "eks_private_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.13.0/24"
  availability_zone = "ap-south-1c"

  tags = {
    Name = "eks-private-subnet-c"
  }
}


# -------------------------
# DB Private Subnets
# -------------------------

resource "aws_subnet" "db_private_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.21.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "db-private-subnet-a"
  }
}

resource "aws_subnet" "db_private_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.22.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "db-private-subnet-b"
  }
}

resource "aws_subnet" "db_private_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.23.0/24"
  availability_zone = "ap-south-1c"

  tags = {
    Name = "db-private-subnet-c"
  }
}
