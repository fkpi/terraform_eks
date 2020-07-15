resource "aws_eks_cluster" "eks" {
  name = var.eks_cluster_name
  role_arn = aws_iam_role.eks_role.arn
  version = "1.17"

  vpc_config {
    subnet_ids = [aws_subnet.public_subnet[0].id, aws_subnet.public_subnet[1].id, aws_subnet.private_subnet[0].id, aws_subnet.private_subnet[1].id]
  }

  depends_on = [aws_iam_role_policy_attachment.eks_AmazonEKSClusterPolicy, aws_iam_role_policy_attachment.eks_AmazonEKSServicePolicy]
}