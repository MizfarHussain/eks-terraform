module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "12.0.0"

  cluster_name = var.cluster-name
  cluster_version = "20.8.4"
  subnets = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id
  enable_irsa = true
  node_groups = {
    default = {
      desired_capacity = 2
      max_capacity = 3
      min_capacity = 1
      instance_type = "t3.medium"
      key_name = "eks-kubernetes"
      create_iam_role = true
      iam_role_name = "eks-nodegroup-role"
      iam_role_additional_policies = ["arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy", "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy", "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"]
    }
}
}     
   