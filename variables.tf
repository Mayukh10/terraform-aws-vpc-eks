variable "kubernetes_version" {
  description = "The version of Kubernetes to use for the EKS cluster."
  type        = string
  default     = "1.33"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "eu-west-1"
}