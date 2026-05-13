variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "sg_name" {
  description = "Security group name"
  type        = string
}

variable "allowed_ports" {
  description = "List of allowed ingress ports"
  type        = list(number)
}