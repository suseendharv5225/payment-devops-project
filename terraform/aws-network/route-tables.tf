# ==========================================
# Public Route Table
# ==========================================

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public-route-table"
  }
}


# ==========================================
# Public Subnet Associations
# ==========================================

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_c" {
  subnet_id      = aws_subnet.public_c.id
  route_table_id = aws_route_table.public.id
}


# ==========================================
# EKS Private Route Table - AZ A
# ==========================================

resource "aws_route_table" "eks_private_a" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_a.id
  }

  tags = {
    Name = "eks-private-route-table-a"
  }
}

resource "aws_route_table_association" "eks_private_a" {
  subnet_id      = aws_subnet.eks_private_a.id
  route_table_id = aws_route_table.eks_private_a.id
}


# ==========================================
# EKS Private Route Table - AZ B
# ==========================================

resource "aws_route_table" "eks_private_b" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_b.id
  }

  tags = {
    Name = "eks-private-route-table-b"
  }
}

resource "aws_route_table_association" "eks_private_b" {
  subnet_id      = aws_subnet.eks_private_b.id
  route_table_id = aws_route_table.eks_private_b.id
}


# ==========================================
# EKS Private Route Table - AZ C
# ==========================================

resource "aws_route_table" "eks_private_c" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_c.id
  }

  tags = {
    Name = "eks-private-route-table-c"
  }
}

resource "aws_route_table_association" "eks_private_c" {
  subnet_id      = aws_subnet.eks_private_c.id
  route_table_id = aws_route_table.eks_private_c.id
}


# ==========================================
# DB Private Route Table
# ==========================================

resource "aws_route_table" "db_private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "db-private-route-table"
  }
}


# ==========================================
# DB Private Subnet Associations
# ==========================================

resource "aws_route_table_association" "db_private_a" {
  subnet_id      = aws_subnet.db_private_a.id
  route_table_id = aws_route_table.db_private.id
}

resource "aws_route_table_association" "db_private_b" {
  subnet_id      = aws_subnet.db_private_b.id
  route_table_id = aws_route_table.db_private.id
}

resource "aws_route_table_association" "db_private_c" {
  subnet_id      = aws_subnet.db_private_c.id
  route_table_id = aws_route_table.db_private.id
}
