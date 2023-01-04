FROM ubuntu:latest

ENV ARCH amd64
ENV HOME /root

RUN apt-get update -y \
    && apt-get install -y binutils build-essential sysstat fio qemu-kvm virt-manager libvirt-clients virtinst jq libvirt-daemon-system fonts-takao python3 python3-pip golang

RUN pip3 install matplotlib

#サイズ削減のため不要なものは削除
RUN apt-get autoremove -y

WORKDIR $HOME/work
