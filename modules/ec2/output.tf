output "elb_dns_name" {
  description = "DNS name of the load balancer"
  value       = aws_elb.wordpress.dns_name
}
