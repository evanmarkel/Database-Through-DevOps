resource "aws_iam_role" "ccdb-node" {
  name = "terraform-eks-ccdb-node"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY

}

resource "aws_iam_role_policy_attachment" "ccdb-node-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role = aws_iam_role.ccdb-node.name
}

resource "aws_iam_role_policy_attachment" "ccdb-node-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role = aws_iam_role.ccdb-node.name
}

resource "aws_iam_role_policy_attachment" "ccdb-node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role = aws_iam_role.ccdb-node.name
}

resource "aws_iam_instance_profile" "ccdb-node" {
  name = "terraform-eks-ccdb"
  role = aws_iam_role.ccdb-node.name
}

