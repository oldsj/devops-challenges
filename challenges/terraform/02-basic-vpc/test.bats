function setup_file() {
    set +e
    load '/test/setup_terraform.bash'

    # apply terraform
    terraform init
    terraform apply -input=false -auto-approve -lock=false    
    set -e
}

function setup() {
    # fail-fast
    [ ! -f ${BATS_PARENT_TMPNAME}.skip ] || skip "skip remaining tests"

    load '/test/bats-support/load.bash'
    load '/test/bats-assert/load.bash'
    load '/test/load.bash'
    cd /tmp/test-terraform
}

AWS="/usr/local/bin/aws --endpoint-url http://moto-test:5000"

@test "terraform output 'vpc_id' is configured" {
    run terraform output vpc_id
    assert_output --partial "vpc"
}

@test "VPC is configured with a CIDR block of 172.16.0.0/16" {
    ID=$(terraform output --raw vpc_id) 
    COMMAND="$AWS ec2 describe-vpcs --vpc-ids $ID --query 'Vpcs[*].CidrBlock' --output text"
    run eval "$COMMAND"
    printf "\n\nERROR: No VPC found using command:\n $COMMAND\n\n"
    assert_output "172.16.0.0/16"
}

function teardown() {
    [ -n "$BATS_TEST_COMPLETED" ] || touch ${BATS_PARENT_TMPNAME}.skip
}

function teardown_file() {
    terraform destroy -auto-approve -input=false -lock=false
}
