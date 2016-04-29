#!/bin/bash
set -e
set -x
mkdir -p /root/.ssh
chmod go-rwx /root/.ssh
echo "${SSHKEY}" | tee -a /root/.ssh/authorized_keys
mkdir -p /var/run/sshd
exec /usr/sbin/sshd -D
