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

@test "EC2 instance exists" {
    COMMAND="$AWS ec2 describe-instances --filters Name=instance-state-name,Values='running'"
    run eval "$COMMAND"
    printf "\n\nERROR: No running EC2 instance found using command:\n $COMMAND\n\n"
    assert_output --partial "InstanceId"
}

@test "EC2 instance is tagged with 'hello-terraform'" {
    COMMAND="$AWS ec2 describe-instances --filters 'Name=tag-value,Values=hello-terraform'"
    run eval "$COMMAND"
    printf "\n\nERROR: No EC2 instance found with tag 'hello-terraform' using command:\n $COMMAND\n\n"
    assert_output --partial 'hello-terraform'
}

function teardown() {
    [ -n "$BATS_TEST_COMPLETED" ] || touch ${BATS_PARENT_TMPNAME}.skip
}

function teardown_file() {
    terraform destroy -auto-approve -input=false -lock=false    
}
