# your code here...
resource "aws_vpc" "main" {
  cidr_block = "172.16.0.0/16"
}

output vpc_id {
  value       = aws_vpc.main.id
}
