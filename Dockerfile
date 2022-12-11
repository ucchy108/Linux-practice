FROM ubuntu:latest

ENV ARCH amd64
ENV GOVERSION 1.7.5
ENV HOME /root
ENV PATH $PATH:/usr/local/go/bin
ENV GOPATH $HOME/work

RUN apt-get update -y \
    && apt-get install vim curl git strace sysstat wget build-essential libreadline-dev libncursesw5-dev libssl-dev libsqlite3-dev libgdbm-dev libbz2-dev liblzma-dev zlib1g-dev uuid-dev libffi-dev libdb-dev -y \
    && curl -s -o /tmp/go.tar.gz https://storage.googleapis.com/golang/go$GOVERSION.linux-$ARCH.tar.gz \
    && tar -C /usr/local -xzf /tmp/go.tar.gz \
    && rm /tmp/go.tar.gz \
    && sed -i 's/ENABLED="false"/ENABLED="true"/' /etc/default/sysstat



#任意バージョンのpython install
RUN wget --no-check-certificate https://www.python.org/ftp/python/3.9.5/Python-3.9.5.tgz \
&& tar -xf Python-3.9.5.tgz \
&& cd Python-3.9.5 \
&& ./configure --enable-optimizations\
&& make \
&& make install

#サイズ削減のため不要なものは削除
RUN apt-get autoremove -y

WORKDIR $HOME/work
