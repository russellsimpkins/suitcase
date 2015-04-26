#!/bin/sh -x
useradd -c "Vagrant" -d /home/vagrant -m -s /bin/bash -p $(openssl passwd -1 vagrant) vagrant

mkdir -p /etc/ssh/authorized_keys/vagrant
chmod 755 /etc/ssh/authorized_keys
chmod 700 /etc/ssh/authorized_keys/vagrant
chown vagrant:root /etc/ssh/authorized_keys/vagrant

mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
chown vagrant:vagrant /home/vagrant/.ssh

# RSS - This key's not correct 
#echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCRsOlZeVl+R6EqwSPKRWMWNe8nXFAJQfV9ePyxo6HqTHUrf344yoLfe/yIgpea7vvIkc/L/SZuY6N4wazqIorbVLvKY4X+MUOAg9WS/mUr4SgtasZei7zu0DDK/rU/1/VIHYvk8UXCH89qxgyqdqmAgnk+1vfIGKr36aarZ+ognnvl4JgTJlmo27+sRzhU4ukCVno0kGLssv6IOH/K5Vp9eDXYZ12g77V90bY1OBzli9Eq6+cwZypQ9zurKg1bMWq5fwwS/x8Y7sssSGFojJcrqG+8Vh9HUNvSEikSpogYbdpSKfQjpa4g4pwJCMe4WUMVRpf8kb8/PLhiBNi5td6L Vagrant insecure key" | tee /etc/ssh/authorized_keys/vagrant/authorized_keys /home/vagrant/.ssh/authorized_keys

# RSS - this key worked from https://github.com/mitchellh/vagrant/blob/master/keys/vagrant.pub
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key" | tee /etc/ssh/authorized_keys/vagrant/authorized_keys /home/vagrant/.ssh/authorized_keys

chmod 600 /etc/ssh/authorized_keys/vagrant/authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown vagrant:vagrant /etc/ssh/authorized_keys/vagrant/authorized_keys /home/vagrant/.ssh/authorized_keys


# Sudo setup
sed -i -e 's/^\s*\(Defaults\s*requiretty\).*$/# \1/g' /etc/sudoers
sed -i -e 's/^\s*\(Defaults\s*always_set_home\).*$/# \1/g' /etc/sudoers
echo 'Defaults    env_keep += "SSH_AUTH_SOCK"' >> /etc/sudoers
echo 'Defaults    env_keep += "HOME"' >> /etc/sudoers
echo 'vagrant ALL=(ALL)    NOPASSWD:ALL' >> /etc/sudoers
