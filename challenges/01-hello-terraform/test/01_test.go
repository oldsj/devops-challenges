package test

import (
	"testing"
	"fmt"
	// "github.com/stretchr/testify/assert"
	// "github.com/stretchr/testify/require"
	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformAwsHelloWorldExample(t *testing.T) {
	t.Parallel()

	var LocalEndpoints = map[string]string{
		"apigateway":     "http://moto:5000",
		"cloudformation": "http://moto:5000",
		"cloudwatch":     "http://moto:5000",
		"dynamodb":       "http://moto:5000",
		"es":             "http://moto:5000",
		"firehose":       "http://moto:5000",
		"iam":            "http://moto:5000",
		"kinesis":        "http://moto:5000",
		"lambda":         "http://moto:5000",
		"route53":        "http://moto:5000",
		"redshift":       "http://moto:5000",
		"s3":             "http://moto:5000",
		"secretsmanager": "http://moto:5000",
		"ses":            "http://moto:5000",
		"sns":            "http://moto:5000",
		"sqs":            "http://moto:5000",
		"ssm":            "http://moto:5000",
		"stepfunctions":  "http://moto:5000",
		"sts":            "http://moto:5000",
		"ec2":            "http://moto:5000",
	}
	aws.SetAwsEndpointsOverrides(LocalEndpoints)

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	vpcId := terraform.Output(t, terraformOptions, "vpc_id")
	subnets := aws.GetSubnetsForVpc(t, vpcId, "us-east-1")

	fmt.Println(subnets[0])
	// require.Equal(t, 2, len(subnets))

}
