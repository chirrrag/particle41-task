variable eks_role_arn {
  type        = string
  default     = "arn:aws:iam::182736198641:role/prod-eks"
}

variable cluster_version {
  type    = string
  default = "1.35"
}

