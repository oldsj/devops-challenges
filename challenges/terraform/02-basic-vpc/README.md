# 02-basic-vpc

1. Using terraform, configure an AWS VPC with a CIDR of 172.16.0.0/16.
2. Output the VPC ID as a terraform output named `vpc_id`

## Resources

### VPC 

- https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html
- VPC Networking
https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html

```
cd terraform/02-basic-vpc
bats test.bats
```
