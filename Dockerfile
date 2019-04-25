FROM williamyeh/ansible:ubuntu18.04

COPY ansible/requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

WORKDIR /etc/ansible