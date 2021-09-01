# 01-hello-terraform

Difficulty: *Beginner*

1. Using terraform, configure an AWS EC2 instance tagged with a name of "hello-terraform".

## :pencil: Prerequisite Knowledge

**beginner**
- what is terraform
- what is aws cloud
- what is a virtual machine

## :books: Resources

### EC2

- EC2 Concepts
  https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html
- Tagging AWS Resources
  https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html

### terraform

- The `docker compose run shell` environment is already configured with AWS credentials and has `terraform` and `aws` installed. A `provider.tf` is already configured for the local AWS environment and does not need modification. **NOTE:** The `provider.tf` in this environment is not configured like you would normally see in a production environment, it's specifically set up for the local AWS environment.
- Get started with terraform
  https://learn.hashicorp.com/tutorials/terraform/aws-build?in=terraform/aws-get-started

- Create an EC2 instance with terraform
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

**NOTE:** Using a data lookup to find an AMI will not work in this environment. You can use any AMI id.

## :white_check_mark: Test your work

- Add terraform code to `main.tf` 
- Run `terraform init`, `terraform plan`, and `terraform apply` commands to apply your terraform code to create the EC2 instance.
- Check that your solution meets all requirements by running

```
./test.sh
```

