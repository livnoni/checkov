resource "aws_eks_cluster" "example_direct" {
  name                      = "example"
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  tags = {
    yor_trace = "f864db21-9ad0-4669-b171-2ffeb614c8e2"
  }
}

resource "aws_eks_cluster" "example_var" {
  name                      = "example"
  enabled_cluster_log_types = var.log_types_enabled
  tags = {
    yor_trace = "2f5ad00f-23d0-48da-98d4-2e572549521f"
  }
}

variable "log_types_enabled" {
  type    = list(string)
  default = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}