# ==========================================
# RDS PostgreSQL
# ==========================================

resource "aws_db_instance" "postgres" {
  identifier = "production-postgres"

  # Engine
  engine         = "postgres"
  engine_version = "16"

  # Instance
  instance_class        = "db.t3.micro"
  allocated_storage     = 50
  max_allocated_storage = 200
  storage_type          = "gp3"
  storage_encrypted     = true

  # Database
  db_name  = "appdb"
  username = "admin1"
  password = var.db_password
  port     = 5432

  # Network
  db_subnet_group_name = aws_db_subnet_group.postgres.name

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]

  # High Availability
  multi_az = true

  # Backup
  backup_retention_period = 0

  # Monitoring
  monitoring_interval = 0

  # Protection
  deletion_protection = false
  skip_final_snapshot = true

  # Logs
  enabled_cloudwatch_logs_exports = [
    "postgresql",
    "upgrade"
  ]

  tags = {
    Name        = "production-postgres"
    Environment = "production"
    ManagedBy   = "terraform"
  }
}


# ==========================================
# RDS Subnet Group
# ==========================================

resource "aws_db_subnet_group" "postgres" {
  name = "production-postgres-subnet-group"

  subnet_ids = [
    aws_subnet.db_private_a.id,
    aws_subnet.db_private_b.id,
    aws_subnet.db_private_c.id
  ]

  tags = {
    Name        = "production-postgres-subnet-group"
    Environment = "production"
    ManagedBy   = "terraform"
  }
}


# ==========================================
# RDS Security Group
# ==========================================

resource "aws_security_group" "rds_sg" {
  name   = "production-rds-sg"
  vpc_id = aws_vpc.main.id

  ingress {
    description     = "PostgreSQL from EKS"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_eks_cluster.main.vpc_config[0].cluster_security_group_id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "production-rds-sg"
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
