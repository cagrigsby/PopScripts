# PopScripts
This repo includes scripts to make using ligolo, impacket-smbserver, and transferring files slightly easier by automating required steps and echoing certain commands such that they can be copy/pasted into a new window on a target machine. I've also added my favorite php-reverse-shell, and a script which prompts you for the IP and port before creating a copy. If you like all the scripts, it is easiest to just run `sudo ./link.sh`. 


## liggy
This script exists to automate the setup of the Ligolo-ng (https://github.com/nicocha30/ligolo-ng) proxy. It requires Ligolo to be in the /opt folder. It requires an IP range to set up a tunnel, but it will accept a specific IP range or a single IP and convert to the IP range of 0/24. 

Run `sudo chmod +x /opt/liggy/liggy.sh && ln -s /opt/liggy/liggy.sh /usr/local/bin/liggy` to be able to call it as liggy from any directory. 

![](Images/liggy.png)
## served
This script prints cerutil, iwr, and wget commands to be run on a remote target to download files from your machine. The default IP is your tun0 (-i), the default port (-p) is 80, and the default file (-f) is `file`, but the script can be run with any of those flags. 

Run `sudo chmod +x /opt/PopScripts/served.sh && ln -s /opt/PopScripts/served.sh /usr/local/bin/served` to be able to call it as liggy from any directory. 

![](Images/served.png)

## speedysmb

This script exists to automate the creation of an impacket-smbserver (https://github.com/fortra/impacket/blob/master/examples/smbserver.py) by requesting a username and password, and then printing the commands that need to be run on a remote machine to transfer files. 

Run `sudo chmod +x /opt/PopScripts/speedysmb.sh && ln -s /opt/PopScripts/speedysmb.sh /usr/local/bin/speedysmb` to be able to call it as speedysmb from any directory.

![](Images/speedysmb.png)

## ivan

This script prompts the user for a IP and Port before generating a new copy of Ivan Sincek's [PHP-Reverse-Shell](https://github.com/ivan-sincek/php-reverse-shell/blob/master/src/reverse/php_reverse_shell.php) in the working directory. 

## to create symbolic links for all of them

Run `sudo chmod +x /opt/PopScripts/served.sh && chmod +x /opt/PopScripts/speedysmb.sh && chmod +x /opt/PopScripts/liggy.sh && chmod +x /opt/PopScripts/ivan.sh && ln -s /opt/PopScripts/served.sh /usr/local/bin/served && ln -s /opt/PopScripts/speedysmb.sh /usr/local/bin/speedysmb && ln -s /opt/PopScripts/liggy.sh /usr/local/bin/liggy && ln -s /opt/PopScripts/ivan.sh /usr/local/bin/ivan`

Or run `sudo ./link.sh`

