resource "aws_eks_node_group" "node_group" {
  cluster_name = var.eks_cluster_name
  node_group_name = var.node_group_name
  node_role_arn = aws_iam_role.worker_node_role.arn
  subnet_ids = [aws_subnet.public_subnet[0].id, aws_subnet.public_subnet[1].id]
  instance_types = ["t3.micro"]
  disk_size = 8
  scaling_config {
    desired_size = 2
    max_size = 4
    min_size = 2
  }

  depends_on = [
    aws_iam_role_policy_attachment.worker_node_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.worker_node_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.worker_node_AmazonEC2ContainerRegistryReadOnly,
    aws_eks_cluster.eks]
}