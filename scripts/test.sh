#!/usr/bin/env bash
shopt -s globstar

for test in /tmp/challenges/**/*.bats
do
  path="$(dirname $test)"
  cd $path
  bats test.bats
done

