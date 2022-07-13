load "${BATS_TEST_DIRNAME}/../load.bash"

load "${BATS_TEST_DIRNAME}/../node_modules/bats-support/load.bash"
load "${BATS_TEST_DIRNAME}/../node_modules/bats-assert/load.bash"
load "${BATS_TEST_DIRNAME}/../node_modules/bats-utils/load.bash"

setup_file() {
    load 'common_setup.bash'
}

@test "Valid log level" {
    run log "foo" "INFO" 2>&1
    assert_success

    assert_output "INFO : foo"
}

@test "Logs stored in stderr and not stdout" {
    run log "foo" "DEBUG"
    assert_output ""
}

@test "Lower log levels are ignored" {
    export script_logging_level="INFO"

    run log "foo" "DEBUG" 2>&1
    assert_output ""
}

@test "Invalid log level" {
    log "foo" "zo"
    [ "$?" -eq 1 ]
}