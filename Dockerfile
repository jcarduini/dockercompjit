# CompJIT
#
# VERSION 	1.1

FROM ubuntu:14.04
MAINTAINER Júlia Caroline <jcarduini@gmail.com>

ADD README.md /root/
RUN apt-get update && apt-get install -y \
	build-essential \
	cmake \
	gfortran \
	git \
	python \
	wget \
	openssl libssl-dev \
&& apt-get clean  

# CMake
RUN wget -P /root/ https://cmake.org/files/v3.6/cmake-3.6.1.tar.gz \
	&& tar -xzvf cmake-3.6.1.tar.gz \
	&& cd cmake-3.6.1 \
	&& ./configure
RUN make 
RUN make install

WORKDIR /root/ 
RUN git clone https://github.com/karies/cling-all-in-one.git \
&& git clone https://github.com/jcarduini/compJIT.git
RUN cd cling-all-in-on && ./clone.sh

ENV PREFIX=/root/cling-all-in-one/inst
ENV PATH=$PREFIX/bin:$PATH
ENV LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH
ENV INCLUDE=$PREFIX/include:$INCLUDE
