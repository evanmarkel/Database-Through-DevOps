resource "aws_eks_node_group" "ccdb-node-group" {
  cluster_name    = aws_eks_cluster.ccdb.name
  node_group_name = "ccdb-ck-test"
  node_role_arn   = aws_iam_role.ccdb-node.arn
  #subnet_ids      = aws_subnet.example[*].id
  subnet_ids      = module.vpc.public_subnets

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  #associate_public_ip_address = true
  # iam_instance_profile = aws_iam_instance_profile.ccdb-node.name
  #image_id = data.aws_ami.eks-worker.id
  instance_types = ["t2.xlarge"]
  #name_prefix = "terraform-eks-ccdb"
  #security_groups = [aws_security_group.ccdb-node.id]
  #user_data_base64 = base64encode(local.ccdb-node-userdata)

  lifecycle {
    create_before_destroy = true
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.ccdb-node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.ccdb-node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.ccdb-node-AmazonEC2ContainerRegistryReadOnly,
  ]
}
