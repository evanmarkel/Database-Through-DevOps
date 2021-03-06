resource "aws_vpc" "us-east-1-terraform-eks-ccdb" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "us-west-1-terraform-eks-ccdb" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_vpc_peering_connection" "foo" {
  vpc_id      = "${aws_vpc.foo.id}"
  peer_vpc_id = "${aws_vpc.bar.id}"
  auto_accept = true
}

resource "aws_vpc_peering_connection_options" "foo" {
  vpc_peering_connection_id = "${aws_vpc_peering_connection.foo.id}"

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_vpc_to_remote_classic_link = true
    allow_classic_link_to_remote_vpc = true
  }
}