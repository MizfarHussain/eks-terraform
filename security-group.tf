resource "aws_security_group" "eks-cluster" {
  vpc_id = module.vpc.vpc_id
  name   = "${var.cluster-name}-eks-cluster"

  tags = {
    Name = "${var.cluster-name}-eks-cluster"
  }

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }


    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}