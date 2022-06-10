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
&& make \
#&& make install #how can I pass variables through here?
&& exit
## builds, but needs to stop before make install to not stop up the process 
    # After building, I ran:
        # docker exec -it rilr/noip:v1.1 bash
        # make install
    # Got noip to update the ip

##nice to have: 
    # The command 'usr/local/bin/noip2 -C'starts the config process for noip
    # Can this be turned into a docker-compose format to pass info through?