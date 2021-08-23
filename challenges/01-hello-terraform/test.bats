function setup_file() {
    terraform apply -input=false -auto-approve -lock=false    
}

setup() {
    load '/test/bats-support/load.bash'
    load '/test/bats-assert/load.bash'
}

@test "vpc cidr is configured" {
    run aws ec2 describe-vpcs --output json #| jq  -e '.Vpcs[]  | select(.CidrBlock == "172.31.0.0/17z")'
    assert_output --partial '172.31.0.0/16'
}

function teardown_file() {
    terraform destroy -auto-approve -input=false -lock=false    
}
