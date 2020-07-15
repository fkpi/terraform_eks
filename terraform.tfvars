region = "eu-central-1"

eks_cluster_name = "fkpi-eks"
eks_iam_role_name = "fkpi-eks-role"

node_group_name = "fkpi-node-group"
worker_node_iam_role_name = "fkpi-worker-node-role"

vpc_cidr_block = "24.0.0.0/16"

public_subnet_cidrs = ["24.0.0.0/21", "24.0.8.0/21"]
private_subnet_cidrs = ["24.0.16.0/21", "24.0.32.0/21"]
subnet_map_public_ip = true

name_tag = "fkpi-tf"