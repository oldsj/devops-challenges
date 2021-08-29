# your code here...


resource "aws_vpc" "basic_vpc" {
  cidr_block       = "172.16.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "basic_vpc"
  }
}




output "vpc_id" {
  value = aws_vpc.basic_vpc.id
}
