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

@test "EC2 instance exists with name tag 'hello-terraform'" {
    ID=$(terraform output -raw instance_id) 
    run aws ec2 describe-instances --instance-ids $ID
    assert_output --partial 'hello-terraform'
}

function teardown_file() {
    terraform destroy -auto-approve -input=false -lock=false    
}
