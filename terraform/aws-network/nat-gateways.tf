# Elastic IPs for NAT Gateways

resource "aws_eip" "nat_a" {
  domain = "vpc"

  tags = {
    Name = "nat-eip-a"
  }
}

resource "aws_eip" "nat_b" {
  domain = "vpc"

  tags = {
    Name = "nat-eip-b"
  }
}

resource "aws_eip" "nat_c" {
  domain = "vpc"

  tags = {
    Name = "nat-eip-c"
  }
}


# NAT Gateways

resource "aws_nat_gateway" "nat_a" {
  allocation_id = aws_eip.nat_a.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "nat-gateway-a"
  }

  depends_on = [aws_internet_gateway.main]
}

resource "aws_nat_gateway" "nat_b" {
  allocation_id = aws_eip.nat_b.id
  subnet_id     = aws_subnet.public_b.id

  tags = {
    Name = "nat-gateway-b"
  }

  depends_on = [aws_internet_gateway.main]
}

resource "aws_nat_gateway" "nat_c" {
  allocation_id = aws_eip.nat_c.id
  subnet_id     = aws_subnet.public_c.id

  tags = {
    Name = "nat-gateway-c"
  }

  depends_on = [aws_internet_gateway.main]
}
