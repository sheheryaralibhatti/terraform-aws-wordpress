variable "name" {
  description = "Name prefix for resources"
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
}

variable "engine_version" {
  description = "The version of the database engine to use"
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "username" {
  description = "The master username for the database"
  type        = string
}

variable "password" {
  description = "The master password for the database"
  type        = string
}

variable "security_group" {
  description = "Security group ID for the RDS instance"
  type        = string
}

variable "subnets" {
  description = "List of subnets to deploy the RDS instance"
  type        = list(string)
}
