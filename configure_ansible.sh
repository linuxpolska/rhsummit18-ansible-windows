#!/bin/bash

log_file="/var/log/ansible-install-`date +'%Y-%m-%d_%H-%M-%S'`.log"

exec 1>> $log_file 2>&1

yum -y install vim git telnet tcpdump nmap gcc python-devel libselinux-python screen

curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
python get-pip.py
pip install virtualenv

export project_virtualenv="/usr/local/python-virtualenvs/project-virtualenv"

mkdir -p "${project_virtualenv}"
virtualenv "${project_virtualenv}"
source "${project_virtualenv}/bin/activate"

cat >/etc/profile.d/ansible.sh <<.
export project_virtualenv="${project_virtualenv}"
source "\${project_virtualenv}/bin/activate"
.

cp -fra /usr/lib64/python2.7/site-packages/selinux ${project_virtualenv}/lib/python*/site-packages/

pip install "pywinrm>=0.2.2"
#pip install "azure==2.0.0rc5"
pip install ansible[azure]

sed -i -e 's/\(^Defaults.*requiretty\)/# \1/' /etc/sudoers

sudo -i -u $(getent passwd 1000|cut -f1 -d:) git clone https://github.com/linuxpolska/rhsummit18-ansible-windows
