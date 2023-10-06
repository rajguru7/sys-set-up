FROM ubuntu:jammy AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential sudo && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS saurabh
ARG TAGS
RUN addgroup --gid 1000 killua
RUN adduser --gecos killua --uid 1000 --gid 1000 --disabled-password killua
RUN usermod -aG sudo killua #To allow sudo access
RUN echo 'killua:admin' | chpasswd
USER killua
WORKDIR /home/killua

FROM saurabh
COPY . .
#CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
