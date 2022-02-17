resource "aws_eks_cluster" "tf_eks" {
  name     = local.cluster_name
  role_arn = aws_iam_role.master.arn
  version  = var.kubernetes_version

  vpc_config {
    security_group_ids = [aws_security_group.master.id]
    subnet_ids         = aws_subnet.eks[*].id
  }

  tags = {
    project   = var.project
    yor_trace = "5496a817-7e44-458e-aedd-a19a6f4103b9"
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy
  ]
}
