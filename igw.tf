#   Internet Gateway
resource "aws_internet_gateway" "cicd-igw" {
  vpc_id = aws_vpc.cicd-vpc.id

  tags = {
    Name = "cicd-igw"
  }
}