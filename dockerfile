FROM ubuntu:22.04

## install essential packages for noip
RUN apt-get update \ 
    && apt-get -y install wget\ 
    && apt -y install make \
    && apt -y install build-essential \
## move to target dir, download / unzip installer, halfway run the installer.
    && cd /usr/local/src \
    && wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz \
    && tar xzf noip-duc-linux.tar.gz \
    && cd noip-2.1.9-1/ \
    && make 
    #&& make install 
## How can I pass variables / keystrokes through here?