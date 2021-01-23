#!/usr/bin/env bash
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
TZ='UTC'; export TZ

# ls -la /usr/bin/* | grep -i '\-> /opt/gcc/bin' | awk '{print $9}'
#
# cd /opt/gcc/bin/
# ls -1 x86_64* | sed 's|.*|ln -svf /opt/gcc/bin/& /usr/bin/&|g'
#


set -e

cd /opt/gcc

echo
ls -la --color=auto bin/
echo
sleep 5

rm -vf /usr/bin/cc
rm -vf /usr/bin/x86_64-linux-gnu-cc
rm -vf /usr/bin/c++
rm -vf /usr/bin/cpp
rm -vf /usr/bin/g++
rm -vf /usr/bin/gcc
rm -vf /usr/bin/gcc-ar
rm -vf /usr/bin/gccbrig
rm -vf /usr/bin/gcc-nm
rm -vf /usr/bin/gcc-ranlib
rm -vf /usr/bin/gcov
rm -vf /usr/bin/gcov-dump
rm -vf /usr/bin/gcov-tool
rm -vf /usr/bin/gfortran


for i in $(ls -la /usr/bin/* | grep -i '\-> /opt/gcc/bin' | awk '{print $9}'); do
    if [[ -e "${i}" ]]; then
        rm -vf "${i}"
    fi
done

rm -f /usr/include/c++/10
rm -f /usr/include/c++/10.*
echo
sleep 2
###############################################################################

ln -svf /opt/gcc/bin/gcc /usr/bin/cc
#ln -svf /opt/gcc/bin/x86_64-linux-gnu-gcc /usr/bin/x86_64-linux-gnu-cc

ln -svf /opt/gcc/bin/c++ /usr/bin/c++
ln -svf /opt/gcc/bin/cpp /usr/bin/cpp
ln -svf /opt/gcc/bin/g++ /usr/bin/g++
ln -svf /opt/gcc/bin/gcc /usr/bin/gcc
ln -svf /opt/gcc/bin/gcc-ar /usr/bin/gcc-ar
ln -svf /opt/gcc/bin/gccbrig /usr/bin/gccbrig
ln -svf /opt/gcc/bin/gcc-nm /usr/bin/gcc-nm
ln -svf /opt/gcc/bin/gcc-ranlib /usr/bin/gcc-ranlib
ln -svf /opt/gcc/bin/gcov /usr/bin/gcov
ln -svf /opt/gcc/bin/gcov-dump /usr/bin/gcov-dump
ln -svf /opt/gcc/bin/gcov-tool /usr/bin/gcov-tool
ln -svf /opt/gcc/bin/gfortran /usr/bin/gfortran
ln -svf /opt/gcc/bin/lto-dump /usr/bin/lto-dump


rm -f /usr/bin/cc
rm -f /usr/bin/gnatgcc
rm -f /usr/bin/f95
ln -svf gcc /usr/bin/cc
ln -svf gcc /usr/bin/gnatgcc
ln -svf gfortran /usr/bin/f95

rm -f /usr/bin/c89
rm -f /usr/bin/c99
install -v -c -m 0755 /opt/gcc/bin/c89 /usr/bin/
install -v -c -m 0755 /opt/gcc/bin/c99 /usr/bin/


[[ -f /opt/gcc/bin/x86_64-redhat-linux-c++ ]] && ln -svf /opt/gcc/bin/x86_64-redhat-linux-c++ /usr/bin/x86_64-redhat-linux-c++
[[ -f /opt/gcc/bin/x86_64-redhat-linux-g++ ]] && ln -svf /opt/gcc/bin/x86_64-redhat-linux-g++ /usr/bin/x86_64-redhat-linux-g++
[[ -f /opt/gcc/bin/x86_64-redhat-linux-gcc ]] && ln -svf /opt/gcc/bin/x86_64-redhat-linux-gcc /usr/bin/x86_64-redhat-linux-gcc
[[ -f /opt/gcc/bin/x86_64-redhat-linux-gcc-10 ]] && ln -svf /opt/gcc/bin/x86_64-redhat-linux-gcc-10 /usr/bin/x86_64-redhat-linux-gcc-10
[[ -f /opt/gcc/bin/x86_64-redhat-linux-gcc-ar ]] && ln -svf /opt/gcc/bin/x86_64-redhat-linux-gcc-ar /usr/bin/x86_64-redhat-linux-gcc-ar
[[ -f /opt/gcc/bin/x86_64-redhat-linux-gccbrig ]] && ln -svf /opt/gcc/bin/x86_64-redhat-linux-gccbrig /usr/bin/x86_64-redhat-linux-gccbrig
[[ -f /opt/gcc/bin/x86_64-redhat-linux-gcc-nm ]] && ln -svf /opt/gcc/bin/x86_64-redhat-linux-gcc-nm /usr/bin/x86_64-redhat-linux-gcc-nm
[[ -f /opt/gcc/bin/x86_64-redhat-linux-gcc-ranlib ]] && ln -svf /opt/gcc/bin/x86_64-redhat-linux-gcc-ranlib /usr/bin/x86_64-redhat-linux-gcc-ranlib
[[ -f /opt/gcc/bin/x86_64-redhat-linux-gfortran ]] && ln -svf /opt/gcc/bin/x86_64-redhat-linux-gfortran /usr/bin/x86_64-redhat-linux-gfortran

[[ -f /opt/gcc/bin/x86_64-linux-gnu-c++ ]] && ln -svf /opt/gcc/bin/x86_64-linux-gnu-c++ /usr/bin/x86_64-linux-gnu-c++
[[ -f /opt/gcc/bin/x86_64-linux-gnu-g++ ]] && ln -svf /opt/gcc/bin/x86_64-linux-gnu-g++ /usr/bin/x86_64-linux-gnu-g++
[[ -f /opt/gcc/bin/x86_64-linux-gnu-gcc ]] && ln -svf /opt/gcc/bin/x86_64-linux-gnu-gcc /usr/bin/x86_64-linux-gnu-gcc
[[ -f /opt/gcc/bin/x86_64-linux-gnu-gcc-10 ]] && ln -svf /opt/gcc/bin/x86_64-linux-gnu-gcc-10 /usr/bin/x86_64-linux-gnu-gcc-10
[[ -f /opt/gcc/bin/x86_64-linux-gnu-gcc-ar ]] && ln -svf /opt/gcc/bin/x86_64-linux-gnu-gcc-ar /usr/bin/x86_64-linux-gnu-gcc-ar
[[ -f /opt/gcc/bin/x86_64-linux-gnu-gccbrig ]] && ln -svf /opt/gcc/bin/x86_64-linux-gnu-gccbrig /usr/bin/x86_64-linux-gnu-gccbrig
[[ -f /opt/gcc/bin/x86_64-linux-gnu-gcc-nm ]] && ln -svf /opt/gcc/bin/x86_64-linux-gnu-gcc-nm /usr/bin/x86_64-linux-gnu-gcc-nm
[[ -f /opt/gcc/bin/x86_64-linux-gnu-gcc-ranlib ]] && ln -svf /opt/gcc/bin/x86_64-linux-gnu-gcc-ranlib /usr/bin/x86_64-linux-gnu-gcc-ranlib
[[ -f /opt/gcc/bin/x86_64-linux-gnu-gfortran ]] && ln -svf /opt/gcc/bin/x86_64-linux-gnu-gfortran /usr/bin/x86_64-linux-gnu-gfortran


###############################################################################
echo
find -L /usr/include/c++/ -type l | xargs -I "{}" rm -f "{}"
find -L /usr/include/c++/ -type l | xargs -I "{}" rm -f "{}"
find -L /usr/include/c++/ -type l | xargs -I "{}" rm -f "{}"
find -L /usr/include/c++/ -type l | xargs -I "{}" rm -f "{}"
echo

if ls /opt/gcc/include/c++/[1-9]* >/dev/null 2>&1; then
    _cpp_dir="$(ls -1 /opt/gcc/include/c++/ | sort -V | uniq | tail -n 1)"
    _cpp_major=$(echo "${_cpp_dir}" | cut -d\. -f1 )

    ln -svf /opt/gcc/include/c++/"${_cpp_dir}" /usr/include/c++/"${_cpp_dir}"
fi

ln -svf 10 /usr/include/c++/10.2.0

echo
ls -la --color /usr/include/c++/
echo
rm -fr /opt/gcc/lib64/libstdc++.so.*.py
rm -fr /opt/gcc/lib64/libstdc++.so.*.pyc
rm -fr /opt/gcc/lib64/libstdc++.so.*.pyo

rm -fr /opt/gcc/lib/libstdc++.so.*.py
rm -fr /opt/gcc/lib/libstdc++.so.*.pyc
rm -fr /opt/gcc/lib/libstdc++.so.*.pyo

rm -fr /etc/ld.so.conf.d/gcc.conf
rm -fr /etc/ld.so.conf.d/gcc-7*.conf
rm -fr /etc/ld.so.conf.d/gcc-8*.conf
rm -fr /etc/ld.so.conf.d/gcc-9*.conf

echo "/opt/gcc/lib64" > /etc/ld.so.conf.d/gcc.conf
echo "/opt/gcc/lib" >> /etc/ld.so.conf.d/gcc.conf
chmod 0644 /etc/ld.so.conf.d/gcc.conf

/sbin/ldconfig
echo
echo " link done"
echo
exit

