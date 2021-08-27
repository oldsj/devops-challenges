setup() {
    load '/test/bats-support/load.bash'
    load '/test/bats-assert/load.bash'
    load '/test/load.bash'
    DATABASE_URL=postgres://postgres:postgres@db:5432/employee_analytics
}

@test "DB is reachable" {
    run psql $DATABASE_URL -c '\dt'
    assert_output --partial 'team_history'
}

@test "team_history table contains 'kenny'" {
    run psql $DATABASE_URL -c 'select * from team_history where name = 'kenny';'
    assert_output --partial 'kenny'
}
