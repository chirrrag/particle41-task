module "test-arm-stateless-spot-nodegroup" {
  source                      = "../modules/eks-nodegroup/eks-node-group"

  //Common Vars
  cluster_version             = var.cluster-version
  environment_name            = "test"
  apiServerEndpoint             = var.apiServerEndpoint
  certificateAuthority         = var.certificateAuthority
  cidr                        = var.cidr
  workload                    = "arm-stateless-spot-nodegroup"
  arm_nodes                   = true
  capacity                    = "ON_DEMAND"
  # nodes_instance_type         = ["t4g.large", "m6gd.large", "m7g.large", "m6g.large"]
  nodes_instance_type         = ["t4g.large","m7g.large","m7g.xlarge","m7g.2xlarge","c7g.large","c7g.xlarge","c7g.2xlarge","r7g.large","r7g.xlarge","r7g.2xlarge","m6g.xlarge","m6g.2xlarge","c6g.xlarge","c6g.2xlarge","r6g.xlarge","r6g.2xlarge"]
  ec2_keypair                 = "portalMum2"
  security_groups             = ["${data.aws_security_group.test-eks-sg-nodegroup.id}"]
  nodes_root_device_size      = 50
  subnets                     = ["${data.aws_subnet.test-eks-subnet-b-nodegroup.id}"]
  eks_role_name               = data.aws_iam_role.test-eks-nodegroup-role.name
  ami_id                      = var.arm-ng-ami-id
#   ami_id                      = "ami-0431db82d7dc815dd" # 1.31 ami
# Update this ami ID based on this parameter /aws/service/eks/optimized-ami/${cluster_version}/amazon-linux-2-arm64/recommended/image_id
# You can find the ami id value in SSM Parameter Store

  nodes_desired_capacity      = 0
  nodes_min_size              = 0
  nodes_max_size              = 70

  kubernetes_taints = [
    {
      key            = "arch"
      value          = "arm"
      effect         = "NO_SCHEDULE"
    }
  ]
  
  common_tags = {
    Team              = "k8s"
    Env               = "qa"
    capacity          = "spot"
    arch              = "arm"
    ec2-created-by    = "eks-nodegroup"
    managed-by        = "terraform"
    os                = "linux"
    product           = "k8s"
    Service            = "k8s"
  }
  
  common_labels = {
    Name                = "test-arm-stateless-ondemand-nodegroup"
    Env                 = "qa"
    arch                = "arm"
    service             = "stateless"
    capacity            = "spot"
  }
}
