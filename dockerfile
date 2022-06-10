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
#&& make install #how can I pass variables through here?
## builds, but needs to stop before make install to not stop up the process 
    # After building, I ran:
        # docker exec -it rilr/noip:v1.2 bash
        # cd noip-2.1.9-1/
        # make install
            # Please enter the login/email string for no-ip.com
            # Please enter the password for user '${USER}'
            # Please enter the password for user '${USER}'  ***********
                #Only one host [${DDNS}.ddns.net] is registered to this account.
                #It will be used.
            # Please enter an update interval:[30]
            # Do you wish to run something at successful update?[N] (y/N)
                # Please enter the script/program name
            #New configuration file '/tmp/no-ip2.conf' created.
            #mv /tmp/no-ip2.conf /usr/local/etc/no-ip2.conf
    # Got noip to update the ip

##nice to have: 
    # The command 'usr/local/bin/noip2 -C'starts the config process for noip
    # Can this be turned into a docker-compose format to pass info through?