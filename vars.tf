variable "region" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "subnet_map_public_ip" {
  type = bool
}

variable "name_tag" {
  type = string
}

variable "eks_cluster_name" {
  type = string
}

variable "eks_iam_role_name" {
  type = string
}

variable "node_group_name" {
  type = string
}

variable "worker_node_iam_role_name" {
  type = string
}

