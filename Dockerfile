#Ansible environment setup for HCI deploy w  modules
#Version 1.0
FROM centos:7

MAINTAINER Seb version: 1.0


RUN yum install -y epel-release && yum install -y python python-pip git && pip install --upgrade pip && pip install ansible && pip install netapp-lib && pip install solidfire-sdk-python && git clone https://github.com/ansible/ansible.git && yes| cp -aRv ansible/lib/ansible/module_utils/netapp* /usr/lib/python2.7/site-packages/ansible/module_utils/ && yes | cp -aRv ansible/lib/ansible/modules/storage/netapp/* /usr/lib/python2.7/site-packages/ansible/modules/storage/netapp/ && rm -rf ansible/ && yum clean all

RUN yum -y install python36-setuptools \
  && easy_install-3.6 pip \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install ansible \
  && pip3 install --upgrade pip \
  && pip install netapp-lib \
  && pip install solidfire-sdk-python \
  && pip install xlsxwriter \
  && git clone http://www.github.com/infragilis/hci \
#  && touch /usr/local/lib/python3.6/site-packages/ansible/module_utils/pstools/__init__.py \
#  && cp /usr/local/lib/python3.6/site-packages/ansible/modules/pstools/testping.yml /hci/ \
#  && awk '{ sub("\r$", ""); print }' testping.yml > hcipingtest.yml \
#  && mv ansible /tmp \
#  && rm -f testping.yml

EXPOSE 2020/udp
