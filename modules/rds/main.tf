resource "aws_db_instance" "wordpress" {
  allocated_storage      = var.allocated_storage
  engine                 = "postgres"
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.db_name
  username               = var.username
  password               = var.password
  parameter_group_name   = "default.postgres10"
  skip_final_snapshot    = true
  vpc_security_group_ids = [var.security_group]
  db_subnet_group_name   = aws_db_subnet_group.wordpress.name

  tags = {
    Name = "${var.name}-rds"
  }
}

resource "aws_db_subnet_group" "wordpress" {
  name       = "${var.name}-subnet-group"
  subnet_ids = var.subnets

  tags = {
    Name = "${var.name}-subnet-group"
  }
}
