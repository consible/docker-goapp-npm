FROM ubuntu
MAINTAINER arran@consible.com

ADD ./work /work

WORKDIR /work

RUN apt-get update && \
  apt-get install -y build-essential golang vim wget htop automake aufs-tools curl git ssh  && \
  curl -sL https://deb.nodesource.com/setup_5.x | bash -  && \
  apt-get install -y nodejs && \
  rm -rf /var/lib/apt/lists/* 

