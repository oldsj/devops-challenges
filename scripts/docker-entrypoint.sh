#!/usr/bin/env bash
echo "127.0.0.1        us-east-1.amazonaws.com" >> /etc/hosts
cp /etc/resolv.conf /tmp
sed -i '1s/^/nameserver 127.0.0.1 \n/' /tmp/resolv.conf
cat /tmp/resolv.conf > /etc/resolv.conf
dnsmasq -k &

# first arg is `-f` or `--some-option`
# or there are no args
if [ "$#" -eq 0 ] || [ "${1#-}" != "$1" ]; then
	# docker run bash -c 'echo hi'
	exec sudo --preserve-env -H -u me bash "$@"
fi

exec sudo --preserve-env -H -u me bash -c "$@"
