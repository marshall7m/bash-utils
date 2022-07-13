load "${BATS_TEST_DIRNAME}/../load.bash"

load "${BATS_TEST_DIRNAME}/../node_modules/bats-support/load.bash"
load "${BATS_TEST_DIRNAME}/../node_modules/bats-assert/load.bash"
load "${BATS_TEST_DIRNAME}/../node_modules/bats-utils/load.bash"

setup_file() {
    load 'common_setup.bash'
}

@test "Variable exists" {
    export FOO=bar
    run var_exists "FOO"
    assert_success
}

@test "Variable does not exists" {
    run var_exists "FOO"
    assert_failure
}