#/bin/sh

/usr/bin/yum install -y nscd
# ensure nscd is enabled for boot
if [ "${os_version::1}" == "7" ]; then
    echo /usr/bin/systemctl enable nscd
else
    echo chkconfig nscd on
fi
