output "rds_sg" {
  value = aws_security_group.rds_sg.id
}

output "elb_sg" {
  value = aws_security_group.elb_sg.id
}

output "instance_sg" {
  value = aws_security_group.instance_sg.id
}
