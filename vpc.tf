module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "2.66.0"

  name = "${var.cluster-name}-vpc"
  cidr = var.vpc-cidr
  azs = ["${var.region}-a", "${var.region}-b", "${var.region}-c"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
  tags = {
    "Terraform" = "true"
    "Environment" = "dev"
  }
}