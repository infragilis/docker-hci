#Ansible env for HCI deploy
#Version 2.1
FROM centos:7
MAINTAINER SeB version: 2.1, switched both api and beacons to 10G network
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
pip3 install xlsxwriter && \
pip3 install requests && \
git clone https://github.com/infragilis/hci && \
sleep 15 && \
cp -r /hci/ansible/lib/ansible/module_utils/pstools /usr/local/lib/python3.6/site-packages/ansible/module_utils/ && \
cp -r /hci/ansible/lib/ansible/modules/pstools/ /usr/local/lib/python3.6/site-packages/ansible/modules/ && \
touch /usr/local/lib/python3.6/site-packages/ansible/module_utils/pstools/__init__.py && \
cp /usr/local/lib/python3.6/site-packages/ansible/modules/pstools/testping.yml /hci/ && \
awk '{ sub("\r$", ""); print }' /hci/testping.yml > /hci/hcipingtest.yml && \
mv /hci/ansible /tmp && \
rm -f /hci/testping.yml
WORKDIR /hci


EXPOSE 2010/udp
