#!/usr/bin/env bash
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
TZ='UTC'; export TZ

set -e
ls -la --color "${1}"
echo
sleep 2
split -b 30M -d -a 2 "${1}" "${1}".part
sleep 2
echo
echo ' done'
exit

