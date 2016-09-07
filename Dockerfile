FROM ubuntu
MAINTAINER arran@consible.com

RUN apt-get update && \
  apt-get install -y build-essential checkinstall vim htop automake aufs-tools curl git ssh wget unzip libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev && \
  curl -sL https://deb.nodesource.com/setup_5.x | bash -  && \
  apt-get install -y nodejs && \
  rm -rf /var/lib/apt/lists/* && \
  mkdir /work && \
  wget https://storage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_linux_amd64-1.9.40.zip -O /gae.zip && \
  unzip /gae.zip && \
  rm -f /gae.zip && \
  wget https://www.python.org/ftp/python/2.7.12/Python-2.7.12.tgz -O /usr/src/Python.tar.gz && \
  tar xzf /usr/src/Python.tar.gz -C /usr/src/ && \
  rm -f /usr/src/Python/tar.gz && \
  pushd /usr/src//usr/src/ && ./configure && make altinstall && popd 

WORKDIR /work

ENV PATH /go_appengine/:$PATH
ENV GOROOT /go_appengine/goroot/
