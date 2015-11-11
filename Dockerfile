FROM ubuntu:14.04
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y  supervisor wget apt-transport-https curl vim

ADD https://github.com/rancher/compose-templates/raw/master/utils/containers/confd/confd-0.11.0-dev-rancher-linux-amd64  /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

COPY supervisor.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /tmp

RUN mkdir -p /etc/supervisor/conf.d
RUN mkdir -p /var/log/supervisor
RUN bash -c 'mkdir -p /etc/confd/{conf.d,templates}'

CMD ["/usr/bin/supervisord"]
