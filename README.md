# Terraform AWS WordPress

This repository contains Terraform configurations to deploy a WordPress site with the following architecture:

- VPC with 2 public and 2 private subnets
- Internet Gateway and NAT Gateway
- WordPress deployed in an Auto Scaling Group in public subnets
- Load Balancer pointing to the Auto Scaling Group
- PostgreSQL database in private subnets

## Project Structure

- `modules/vpc`: Terraform module for VPC and related resources
- `modules/ec2`: Terraform module for EC2 instances, Auto Scaling Group, and Load Balancer
- `modules/rds`: Terraform module for RDS PostgreSQL database
- `main.tf`: Main Terraform configuration file
- `variables.tf`: Input variables
- `outputs.tf`: Output values
- `provider.tf`: Provider configuration
- `versions.tf`: Terraform and provider versions

## Usage

1. **Clone the repository:**

```bash
git clone https://github.com/yourusername/terraform-aws-wordpress.git
cd terraform-aws-wordpress


1. **Initialize Terraform:**

```bash
terraform init

1. **Apply the configuration:**

```bash
terraform apply
