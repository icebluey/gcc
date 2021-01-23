#!/usr/bin/env bash
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
TZ='UTC'; export TZ

/sbin/ldconfig >/dev/null 2>&1

set -e

if [[ ! -e /opt/gcc/lib64/libstdc++.so.6 ]] || [[ ! -e /opt/gcc/lib/libstdc++.so.6 ]]; then
    echo
    echo '  no /opt/gcc/lib64/libstdc++.so.6 or no /opt/gcc/lib/libstdc++.so.6'
    echo
    exit 1
fi

echo

ls -la --color /opt/gcc/lib64/libstdc++.so.6
ls -la --color /opt/gcc/lib64/libstdc++.so
ls -la --color /opt/gcc/lib/libstdc++.so.6
ls -la --color /opt/gcc/lib/libstdc++.so

ls -la --color /opt/gcc/lib64/libstdc++.so.6.*
ls -la --color /opt/gcc/lib/libstdc++.so.6.*

_so64_filename="$(find /opt/gcc/lib64/ -maxdepth 1 -mindepth 1 -iname 'libstdc++.so.*.*' -type f | sed 's|/opt/gcc/lib64/||g' | sort -V | uniq | tail -n 1)"
_so_filename="$(find /opt/gcc/lib/ -maxdepth 1 -mindepth 1 -iname 'libstdc++.so.*.*' -type f | sed 's|/opt/gcc/lib/||g' | sort -V | uniq | tail -n 1)"

echo
rm -f /opt/gcc/lib64/libstdc++.so.6
rm -f /opt/gcc/lib64/libstdc++.so
rm -f /opt/gcc/lib/libstdc++.so.6
rm -f /opt/gcc/lib/libstdc++.so
sleep 2
echo
ln -sf "${_so64_filename}" /opt/gcc/lib64/libstdc++.so.6
ln -sf "${_so64_filename}" /opt/gcc/lib64/libstdc++.so

ln -sf "${_so_filename}" /opt/gcc/lib/libstdc++.so.6
ln -sf "${_so_filename}" /opt/gcc/lib/libstdc++.so
echo
ls -la --color /opt/gcc/lib64/libstdc++.so*
ls -la --color /opt/gcc/lib/libstdc++.so*


# 64
[ -e /opt/gcc/lib/gcc/x86_64-redhat-linux/10/libstdc++.so ] && ( 
cd /opt/gcc/lib/gcc/x86_64-redhat-linux/10/
rm -f /opt/gcc/lib/gcc/x86_64-redhat-linux/10/libstdc++.so
ln -svf ../../../../lib64/libstdc++.so.6.*[0-9] /opt/gcc/lib/gcc/x86_64-redhat-linux/10/libstdc++.so
ls -la --color /opt/gcc/lib/gcc/x86_64-redhat-linux/10/libstdc++.so
)
# 32
[ -e /opt/gcc/lib/gcc/x86_64-redhat-linux/10/32/libstdc++.so ] && ( 
cd /opt/gcc/lib/gcc/x86_64-redhat-linux/10/32/
rm -f /opt/gcc/lib/gcc/x86_64-redhat-linux/10/32/libstdc++.so
ln -svf ../../../../libstdc++.so.6.*[0-9] /opt/gcc/lib/gcc/x86_64-redhat-linux/10/32/libstdc++.so
ls -la --color /opt/gcc/lib/gcc/x86_64-redhat-linux/10/32/libstdc++.so
)

sleep 1
/sbin/ldconfig >/dev/null 2>&1 
sleep 1

echo
exit

