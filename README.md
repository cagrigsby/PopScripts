# PopScripts

## speedysmb

This script exists to automate the creation of an impacket-smbserver (https://github.com/fortra/impacket/blob/master/examples/smbserver.py) by requesting a username and password, and then printing the commands that need to be run on a remote machine to transfer files. 

Run sudo chmod +x /opt/speedysmb/speedysmb.sh && ln -s /opt/speedysmb/speedysmb.sh /usr/local/bin/speedysmb to be able to call it as speedysmb from any directory.

## liggy
This script exists to automate the setup of the Ligolo-ng (https://github.com/nicocha30/ligolo-ng) proxy. It requires Ligolo to be in the /opt folder. It requires an IP range to set up a tunnel, but it will accept a specific IP range or a single IP and convert to the IP range of 0/24. 

Run `sudo chmod +x /opt/liggy/liggy.sh && ln -s /opt/liggy/liggy.sh /usr/local/bin/liggy` to be able to call it as liggy from any directory. 


