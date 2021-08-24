# 01-hello-terraform

1. Using terraform, configure an AWS EC2 instance tagged with a name of "hello-terraform".
2. Output the EC2 instance ID as a terraform output named `instance_id`

## Resources

### EC2

- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html

### terraform

- Get started with terraform. The `docker compose run shell` environment is already configured with AWS credentials and has `terraform` and `aws` installed. A `provider.tf` is already configured for the local AWS environment and does not need modification.
https://learn.hashicorp.com/tutorials/terraform/aws-build?in=terraform/aws-get-started

- How to create an EC2 instance with terraform. 
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

- terraform outputs 
https://www.terraform.io/docs/language/values/outputs.html

**NOTE:** Using a data lookup to find an AMI will not work in this environment. You can use any AMI id.

```
cd terraform/01-hello-terraform
bats test.bats
```
