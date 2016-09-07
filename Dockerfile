FROM ubuntu
MAINTAINER arran@consible.com

RUN apt-get update && \
  apt-get install -y build-essential vim htop automake aufs-tools curl git ssh wget unzip && \
  curl -sL https://deb.nodesource.com/setup_5.x | bash -  && \
  apt-get install -y nodejs && \
  rm -rf /var/lib/apt/lists/* && \
  mkdir /work && \
  wget https://storage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_linux_amd64-1.9.40.zip -o /gae.zip && \
  unzip /gae.zip && \
  rm -f /gae.zip

WORKDIR /work
