# builds, but needs to stop before make install to not stop up the process 
    # After building, I ran:
        # docker exec -it rilr/noip:v1.2 bash
        # cd noip-2.1.9-1/
        # make install
            # Please enter the login/email string for no-ip.com
            # Please enter the password for user '${USER}'
            # Please enter the password for user '${USER}'  ***********
                #Only one host [${DDNS}.ddns.net] is registered to this account.
                    # Maybe buy a second ddns to add that as a use case down the road?
                #It will be used.
            # Please enter an update interval:[30]
            # Do you wish to run something at successful update?[N] (y/N)
                # Please enter the script/program name
            #New configuration file '/tmp/no-ip2.conf' created.
            #mv /tmp/no-ip2.conf /usr/local/etc/no-ip2.conf
        # exit
    # docker start ${CONT_NAME}
    # Got noip to update the ip

# Nice to have: 
    # The command 'usr/local/bin/noip2 -C' starts the config process for noip
    # Can this be turned into a docker-compose format to pass info through to?