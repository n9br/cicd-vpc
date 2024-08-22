# Outputs für VPC und Subnetze
output "cicd-vpc-id" {
  value = aws_vpc.cicd-vpc.id
}

output "cicd-security-group-id" {
  value = aws_security_group.cicd-sg.id
}

# Outputs für öffentliche Subnetze, benannt nach den statischen Namen
output "cicd-public-subnet-1a-id" {
  value = aws_subnet.public[0].id
}

output "cicd-public-subnet-1b-id" {
  value = aws_subnet.public[1].id
}

output "cicd-public-subnet-1c-id" {
  value = aws_subnet.public[2].id
}

# Outputs für private Subnetze, benannt nach den statischen Namen
output "cicd-private-subnet-1a-id" {
  value = aws_subnet.private[0].id
}

output "cicd-private-subnet-1b-id" {
  value = aws_subnet.private[1].id
}

output "cicd-private-subnet-1c-id" {
  value = aws_subnet.private[2].id
}