variable "cluster-name" {
  description = "The name of the EKS cluster"
  type        = string
  
}
variable "vpc-cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  
}
variable "region" {
  description = "The AWS region"
  type        = string
  
}