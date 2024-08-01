#   VPC
resource "aws_vpc" "cicd-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "cicd-vpc"
  }
}

#   Public Subnets
resource "aws_subnet" "cicd-subnet-pub-1a" {
  vpc_id                  = aws_vpc.cicd-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "cicd-subnet-pub-1a"
  }
}

resource "aws_subnet" "cicd-subnet-pub-1b" {
  vpc_id                  = aws_vpc.cicd-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "cicd-subnet-pub-1b"
  }
}
resource "aws_subnet" "cicd-subnet-pub-1c" {
  vpc_id                  = aws_vpc.cicd-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "eu-central-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "cicd-subnet-pub-1c"
  }
}

#   Internet Gateway
resource "aws_internet_gateway" "cicd-igw" {
  vpc_id = aws_vpc.cicd-vpc.id

  tags = {
    Name = "cicd-igw"
  }
}

#   Routing Table
resource "aws_route_table" "cicd-rt" {
  vpc_id = aws_vpc.cicd-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cicd-igw.id
  }

  tags = {
    Name = "cicd-rt"
  }

}

#   Routing Table Associations
resource "aws_route_table_association" "rt-assoc-pub-1a" {
  subnet_id      = aws_subnet.cicd-subnet-pub-1a.id
  route_table_id = aws_route_table.cicd-rt.id
}
resource "aws_route_table_association" "rt-assoc-pub-1b" {
  subnet_id      = aws_subnet.cicd-subnet-pub-1b.id
  route_table_id = aws_route_table.cicd-rt.id
}
resource "aws_route_table_association" "rt-assoc-pub-1c" {
  subnet_id      = aws_subnet.cicd-subnet-pub-1c.id
  route_table_id = aws_route_table.cicd-rt.id
}

#   Security Group
resource "aws_security_group" "cicd-sg" {
  name   = "cicd-sg"
  vpc_id = aws_vpc.cicd-vpc.id
  tags = {
    Name = "cicd-sg"
  }
}

resource "aws_security_group_rule" "cicd-ingress-ssh" {
  security_group_id = aws_security_group.cicd-sg.id
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "cicd-egress-all" {
  security_group_id = aws_security_group.cicd-sg.id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}
