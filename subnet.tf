resource "aws_subnet" "public_subnet" {
  count = 2

  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet_cidrs[count.index]
  map_public_ip_on_launch = true


  tags = {
    Name = "${var.name_tag}-eks-public"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }
}

resource "aws_subnet" "private_subnet" {
  count = 2

  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_subnet_cidrs[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.name_tag}-eks-private"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_rt_association" {
  count = length(aws_subnet.public_subnet)
  route_table_id = aws_route_table.public_route_table.id
  subnet_id = aws_subnet.public_subnet[count.index].id
}