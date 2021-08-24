function setup_file() {
    set +e
    terraform init
    terraform apply -input=false -auto-approve -lock=false    
    set -e
}

setup() {
    load '/test/bats-support/load.bash'
    load '/test/bats-assert/load.bash'
}

@test "VPC is configured with a CIDR block of 172.16.0.0/16" {
    ID=$(terraform output -raw vpc_id) 
    run aws ec2 describe-vpcs --vpc-ids $ID --query "Vpcs[*].CidrBlock" --output text
    assert_output "172.16.0.0/16"
}

function teardown_file() {
    terraform destroy -auto-approve -input=false -lock=false    
}
