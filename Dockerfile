FROM ubuntu:18.04
# Update Ubuntu Software repository
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev git ansible\
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip \
  && pip install netapp-lib \
  && pip install solidfire-sdk-python \
  && pip install xlsxwriter
  && touch /usr/local/lib/python3.6/site-packages/ansible/module_utils/pstools/__init__.py
  && cp /usr/local/lib/python3.6/site-packages/ansible/modules/pstools/testping.yml /hci/
  && awk '{ sub("\r$", ""); print }' testping.yml > hcipingtest.yml
  && mv ansible /tmp
  && rm -f testping.yml

EXPOSE 2020/udp
