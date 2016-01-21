FROM centos:7

MAINTAINER Luis Fernando Gomes <dev@luiscoms.com.br>

RUN yum install -y gcc gcc-c++ make xerces-c-devel openssl-devel readline-devel\
	wget\
	&& cd /tmp/ \
	&& wget ftp://ftp.registro.br/pub/libepp-nicbr/libepp-nicbr-1.15.tar.gz\
	&& tar xzvf libepp-nicbr-1.15.tar.gz && cd libepp-nicbr-1.15\
	&& ./configure && make && make install

WORKDIR /libepp-nicbr