#Ansible environment setup for HCI deploy w  modules
#Version 1.0
FROM centos:7

MAINTAINER Seb version: 1.0


RUN yum install -y epel-release \
  && yum install -y python python-pip git \
  && pip install --upgrade pip \
  && pip install ansible \
  && pip install netapp-lib \ 
  && pip install solidfire-sdk-python \ 
  && git clone https://github.com/ansible/ansible.git \ 
  && yes| cp -aRv ansible/lib/ansible/module_utils/netapp* /usr/lib/python2.7/site-packages/ansible/module_utils/ \
  && yes | cp -aRv ansible/lib/ansible/modules/storage/netapp/* /usr/lib/python2.7/site-packages/ansible/modules/storage/netapp/ 
  && yum clean all \


EXPOSE 2020/udp
