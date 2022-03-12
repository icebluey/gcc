### CentoOS 7
```
yum install -y epel-release && yum makecache
yum upgrade -y epel-release && yum makecache
yum install -y libzstd zstd tar xz gzip bzip2
```

### Install kernel-headers latest first!
```
# gcc need glibc-devel glibc-headers kernel-headers
yum install gcc cpp
yum install gcc-c++ libstdc++-devel
yum install redhat-rpm-config
```

### Exclude after installation
```
yum install -y gmp mpfr libmpc
yum install -y gmp-devel mpfr-devel libmpc-devel
yum install -y gmp-static

# Add the following line to /etc/yum.conf
exclude=gmp.* gmp-* mpfr.* mpfr-* libmpc.* libmpc-*
```

```
cd .pre-install
sha256sum -c sha256sums.txt
ls -1 *.tar.xz | xargs --no-run-if-empty -I '{}' tar -xf '{}' -C /
yum install binutils/binutils-[0-9]*.el7.x86_64.rpm
cd ..
```

```
sha256sum -c gcc-10.3.1-20220114-1.el7.x86_64.tar.xz.sha256
tar -xf gcc-10.3.1-20220114-1.el7.x86_64.tar.xz -C /opt/
/opt/gcc/.00install
```

