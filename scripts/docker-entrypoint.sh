#!/usr/bin/env bash

# first arg is `-f` or `--some-option`
# or there are no args
if [ "$#" -eq 0 ] || [ "${1#-}" != "$1" ]; then
	# docker run bash -c 'echo hi'
	exec sudo --preserve-env -H -u me bash "$@"
fi

exec sudo --preserve-env -H -u me bash -c "$@"
