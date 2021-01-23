#!/usr/bin/env bash
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
TZ='UTC'; export TZ

cat gcc-10.2.0-1.el7.x86_64.tar.xz.part00 > gcc-10.2.0-1.el7.x86_64.tar.xz
cat gcc-10.2.0-1.el7.x86_64.tar.xz.part01 >> gcc-10.2.0-1.el7.x86_64.tar.xz

sleep 2
echo
sha256sum -c gcc-10.2.0-1.el7.x86_64.tar.xz.sha256
echo
exit

