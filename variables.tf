variable "region" {
  type        = string
  description = "Region where the AWS resources will live."
}

variable "account_alias" {
  type        = string
  description = "Friendly name for the AWS account."
}

variable "stack_name" {
  type        = string
  description = "Friendly name for the stack."
}

variable "worker_instance_type" {
  type        = string
  description = "Type of EC2 instance for the kubernetes worker nodes."
}

variable "vpc_id" {
  type        = string
  description = "VPC where the stack will live."
}

variable "app_subnet_a_id" {
  type        = string
  description = "Subnet ID for the first app teir subnet."
}

variable "app_subnet_b_id" {
  type        = string
  description = "Subnet ID for the second app teir subnet."
}

variable "web_subnet_a_id" {
  type        = string
  description = "Subnet ID for the first web teir subnet."
}

variable "web_subnet_b_id" {
  type        = string
  description = "Subnet ID for the second web teir subnet."
}