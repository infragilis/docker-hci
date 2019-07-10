#Ansible env for HCI deploy
#Version 1.b
FROM centos:7
MAINTAINER SeB version: 1.b
RUN yum install -y epel-release && \
yum install -y python python-pip git && \
pip install --upgrade pip && \
pip install ansible && \
pip install netapp-lib && \
pip install solidfire-sdk-python && \
git clone https://github.com/ansible/ansible.git && \
yes| cp -aRv ansible/lib/ansible/module_utils/netapp* /usr/lib/python2.7/site-packages/ansible/module_utils/ && \
yes | cp -aRv ansible/lib/ansible/modules/storage/netapp/* /usr/lib/python2.7/site-packages/ansible/modules/storage/netapp/ && \
rm -rf ansible/ && yum clean all && \
yum -y install python36-setuptools && \
easy_install-3.6 pip && \
pip3 install ansible && \
git clone https://github.com/infragilis/hci

EXPOSE 2020/udp
