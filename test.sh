#!/usr/bin/env bats

source actions.sh

#
# set_output tests
#

@test "set_output sets output" {
    result=$(set_output foo "bar")
    [ "$result" == "::set-output name=foo::bar" ]
}

@test "set_output escapes newlines" {
    result=$(set_output escaped $'foo\nbar\nbaz\n')
    [ "$result" == "::set-output name=escaped::foo%0Abar%0Abaz%0A" ]
}

@test "set_output escapes carriage returns" {
    result=$(set_output escaped $'foo\rbar\rbaz\r')
    [ "$result" == "::set-output name=escaped::foo%0Dbar%0Dbaz%0D" ]
}

@test "set_output escapes carriage returns and newlines" {
    result=$(set_output escaped $'foo\r\nbar\r\nbaz\r\n')
    [ "$result" == "::set-output name=escaped::foo%0D%0Abar%0D%0Abaz%0D%0A" ]
}

@test "set_output escapes percents" {
    result=$(set_output escaped $'%0D%0A\r\n')
    [ "$result" == "::set-output name=escaped::%250D%250A%0D%0A" ]
}
