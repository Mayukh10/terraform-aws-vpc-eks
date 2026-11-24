module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "my-eks-cluster"
  kubernetes_version = var.kubernetes_version

  endpoint_public_access = true
  # Floci's caller is the account root, which access entries reject. Set true on real AWS.
  enable_cluster_creator_admin_permissions = false

  # IRSA fetches the OIDC issuer's TLS cert over the internet; off for local Floci.
  enable_irsa = false

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.medium"]
      min_size       = 1
      max_size       = 2
      desired_size   = 1

      # Floci has no public EKS AMI SSM parameters; let EKS pick the default AMI.
      use_latest_ami_release_version = false
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
