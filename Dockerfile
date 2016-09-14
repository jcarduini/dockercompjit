# CompJIT
#
# VERSION 	1.1

# IMAGEM BASE
FROM ubuntu:14.04
MAINTAINER Júlia Caroline <jcarduini@gmail.com>

ADD README.md /root/

#INSTALACAO DE DEPENDENCIAS
RUN \
	apt-get update && apt-get install -y \
	build-essential \
	curl \
	cmake \
	gfortran \
	git \
	python \
	wget \
	openssl libssl-dev && \
	rm -rf /var/lib/apt/lists/*
# CMake
WORKDIR /root/ 
RUN \
	wget -P /root/ https://cmake.org/files/v3.6/cmake-3.6.1.tar.gz && \
	tar -xzvf cmake-3.6.1.tar.gz && \
	cd cmake-3.6.1 && \
	./configure && \
	make && \
	make install

WORKDIR /root/ 
# CLONAGEM DOS DIRETORIOS DO PROJETO
RUN \
	rm -rf cling-all-in-one \
	compJIT && \	
	git clone https://github.com/karies/cling-all-in-one.git && \
	git clone https://github.com/jcarduini/compJIT.git 

WORKDIR /root/cling-all-in-one 
RUN ./clone.sh

# DECLARACAO DE VARIAVEIS DE AMBIENTE
ENV PREFIX=/root/cling-all-in-one/inst
ENV PATH=$PREFIX/bin:$PATH
ENV LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH
ENV INCLUDE=$PREFIX/include:$INCLUDE
