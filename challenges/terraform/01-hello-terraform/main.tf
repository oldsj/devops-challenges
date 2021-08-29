# your code here


resource "aws_instance" "tf_instance"{

  ami                    = "ami-00399ec92321828f5"
  # enter ami string from step-1

  instance_type          = "t2.micro"
  # enter instance type string from step-2

  key_name               = "cloud-ubuntu"
  # enter key pair name 

  tags = {
    Name   = "hello-terraform"

  }
}


output "instance_id" {
  value = aws_instance.tf_instance.tags
}