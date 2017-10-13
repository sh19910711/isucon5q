FROM ubuntu:16.04

RUN apt update && apt install -y wget perl libdbi-perl libdbd-mysql-perl libterm-readkey-perl libio-socket-ssl-perl libmysqlclient-dev mysql-common libgdbm3 libnet-ssleay-perl perl-modules

# install pt-query-digest
RUN wget https://www.percona.com/downloads/percona-toolkit/2.2.17/deb/percona-toolkit_2.2.17-1_all.deb && dpkg -i percona-toolkit_2.2.17-1_all.deb

# install alp
RUN cd $(mktemp -d) && \
  apt install -y unzip && \
  wget https://github.com/tkuchiki/alp/releases/download/v0.3.1/alp_linux_amd64.zip && \
  unzip alp_linux_amd64.zip && \
  cp alp /usr/local/bin/
