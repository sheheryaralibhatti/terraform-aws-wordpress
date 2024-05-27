variable "name" {
  description = "Name prefix for resources"
  type        = string
}

variable "ami" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
}

variable "subnets" {
  description = "List of subnets to deploy the instances"
  type        = list(string)
}

variable "security_groups" {
  description = "List of security group IDs to attach"
  type        = list(string)
}

variable "elb_security_group" {
  description = "Security group ID for the ELB"
  type        = string
}
