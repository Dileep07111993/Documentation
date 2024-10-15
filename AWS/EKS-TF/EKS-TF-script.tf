provider "aws" {
  region = "eu-west-3"
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet_a" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-3a"
}

resource "aws_subnet" "subnet_b" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-3b"
}

resource "aws_eks_cluster" "example" {
  name     = "my-eks-cluster"
  role_arn = "arn:aws:iam::686255979378:role/TerraformforAWS"

  vpc_config {
    subnet_ids = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
  }
}

resource "aws_eks_node_group" "example" {
  cluster_name    = aws_eks_cluster.example.name
  node_group_name = "default"
  node_role_arn   = "arn:aws:iam::686255979378:role/TerraformforAWS"
  subnet_ids      = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
  instance_types  = ["t2.micro"]

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 1
  }
}
