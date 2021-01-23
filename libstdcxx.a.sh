#!/usr/bin/env bash
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
TZ='UTC'; export TZ

/sbin/ldconfig >/dev/null 2>&1

set -e

ls -la --color /opt/gcc/lib/gcc/x86_64-redhat-linux/10/libstdc++.a
ls -la --color /opt/gcc/lib/gcc/i686-redhat-linux/10/libstdc++.a

echo

#------------------------------------------------------------------------------

# /opt/gcc/lib/gcc/x86_64-redhat-linux/10/libstdc++.a
# /opt/gcc/lib/gcc/i686-redhat-linux/10/libstdc++.a

rm -f /opt/gcc/lib64/libstdc++.so.6
rm -f /opt/gcc/lib64/libstdc++.so
rm -f /opt/gcc/lib/libstdc++.so.6
rm -f /opt/gcc/lib/libstdc++.so
sleep 2

echo '/* GNU ld script
   Use the shared library, but some functions are only in
   the static library, so try that secondarily.  */
OUTPUT_FORMAT(elf64-x86-64)
INPUT ( /opt/gcc/lib/gcc/x86_64-redhat-linux/10/libstdc++.a )' \
 > /opt/gcc/lib64/libstdc++.so.6

echo '/* GNU ld script
   Use the shared library, but some functions are only in
   the static library, so try that secondarily.  */
OUTPUT_FORMAT(elf32-i386)
INPUT ( /opt/gcc/lib/gcc/i686-redhat-linux/10/libstdc++.a )' \
 > /opt/gcc/lib/libstdc++.so.6

cp -pf /opt/gcc/lib64/libstdc++.so.6 /opt/gcc/lib64/libstdc++.so
cp -pf /opt/gcc/lib/libstdc++.so.6 /opt/gcc/lib/libstdc++.so

#------------------------------------------------------------------------------

# 64
[ -e /opt/gcc/lib/gcc/x86_64-redhat-linux/10/libstdc++.so ] && ( 
cd /opt/gcc/lib/gcc/x86_64-redhat-linux/10/
rm -f /opt/gcc/lib/gcc/x86_64-redhat-linux/10/libstdc++.so
ln -svf ../../../../lib64/libstdc++.so.6 /opt/gcc/lib/gcc/x86_64-redhat-linux/10/libstdc++.so
ls -la --color /opt/gcc/lib/gcc/x86_64-redhat-linux/10/libstdc++.so
)
# 32
[ -e /opt/gcc/lib/gcc/x86_64-redhat-linux/10/32/libstdc++.so ] && ( 
cd /opt/gcc/lib/gcc/x86_64-redhat-linux/10/32/
rm -f /opt/gcc/lib/gcc/x86_64-redhat-linux/10/32/libstdc++.so
ln -svf ../../../../libstdc++.so.6 /opt/gcc/lib/gcc/x86_64-redhat-linux/10/32/libstdc++.so
ls -la --color /opt/gcc/lib/gcc/x86_64-redhat-linux/10/32/libstdc++.so
)

echo
ls -la --color /opt/gcc/lib64/libstdc++.so*
ls -la --color /opt/gcc/lib/libstdc++.so*

sleep 1
/sbin/ldconfig >/dev/null 2>&1 
sleep 1

echo
exit

