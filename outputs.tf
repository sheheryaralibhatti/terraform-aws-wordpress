output "elb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = module.ec2.elb_dns_name
}
