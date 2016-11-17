FROM python:2.7
MAINTAINER stanley@linuxsimba.com


RUN pip install --upgrade pip wheel jinja2

RUN apt-get update && \
  apt-get -y -q install git build-essential python-dev libyaml-dev \
    libffi-dev libpq-dev libxml2-dev libxmlsec1-dev supervisor libpq5


RUN git clone https://github.com/linuxsimba/security_monkey /usr/local/src/security_monkey

WORKDIR /usr/local/src/security_monkey

RUN git checkout tags/v0.7.2 -b v0.7.2

RUN python setup.py bdist_wheel
RUN pip install dist/*

RUN apt-get purge -y git build-essential python-dev libyaml-dev \
    libffi-dev libpq-dev libxml2-dev libxmlsec1-dev && \
  apt-get -y autoremove && \
  apt-get clean

RUN mkdir /var/log/security_monkey &&\
  chown www-data:www-data /var/log/security_monkey

RUN cp supervisor/security_monkey.conf /etc/supervisor/conf.d/security_monkey.conf

ADD ./config-deploy.py.noaws /usr/local/src/security_monkey/env-config/config-deploy.py


COPY docker-entrypoint.sh /

# for testing only
# CMD tail -f /etc/hosts


CMD ["/docker-entrypoint.sh"]
