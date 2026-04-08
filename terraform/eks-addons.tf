module "vpc-addon" {
  source = "../modules/eks-addons"

  addon-name    = "vpc-cni"
  cluster-name  = var.cluster-name
  addon-version = "v1.21.1-eksbuild.5" #1.34
  # addon-version = "v1.21.1-eksbuild.3" # 1.33
  iam-role-arn        = ""
  addon-configuration = file("${path.module}/configs/vpc-cni.json")
}

module "kube-proxy-addon" {
  source = "../modules/eks-addons"

  addon-name    = "kube-proxy"
  cluster-name  = var.cluster-name
  addon-version = "v1.34.3-eksbuild.5" # 1.34
  # addon-version = "v1.33.5-eksbuild.2" # 1.33
  iam-role-arn        = ""
  addon-configuration = file("${path.module}/configs/kube-proxy.json")
}

module "coredns-addon" {
  source = "../modules/eks-addons"

  addon-name    = "coredns"
  cluster-name  = var.cluster-name
  addon-version = "v1.13.2-eksbuild.4" # 1.34
  # addon-version = "v1.12.4-eksbuild.6" # 1.33
  iam-role-arn        = ""
  addon-configuration = file("${path.module}/configs/core-dns.json")
}

module "ebs-csi-addon" {
  source = "../modules/eks-addons"

  addon-name    = "aws-ebs-csi-driver"
  cluster-name  = var.cluster-name
  addon-version = "v1.57.1-eksbuild.1" #1.34
  # addon-version = "v1.55.0-eksbuild.1" # 1.33
  iam-role-arn        = "arn:aws:iam::618305041992:role/prod-aws-ebs-csi-controller-sa"
  addon-configuration = file("${path.module}/configs/ebs-csi.yaml")
}