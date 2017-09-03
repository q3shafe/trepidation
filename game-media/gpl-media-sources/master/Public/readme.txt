DPMaster for Trepidation
========================
Master server for Trepidation.   

DPMASTER.EXE 	- Windows Binary
DPMASTER 	- Linux 32 bit binary
dpsource.zip	- Source Code

Windows
=======
Run from the command line.  

Run dpmaster.exe /help for options.

Syntax: dpmaster [options]
Available options are:
  -h               : this help
  -H <hash_size>   : hash size in bits, up to 8 (default: 6)
  -l <address>     : listen on local address <address>
  -m <a1>=<a2>     : map address <a1> to <a2> when sending it to clients
                     addresses can contain a port number (ex: myaddr.net:1234)
  -n <max_servers> : maximum number of servers recorded (default: 256)
  -p <port_num>    : use port <port_num> (default: 27950)
  -v [verbose_lvl] : verbose level, up to 4 (default: 3; no value means max)


LINUX
=====
For help use --help command line.

Syntax: dpmaster [options]
Available options are:
  -D               : run as a daemon
  -h               : this help
  -H <hash_size>   : hash size in bits, up to 8 (default: 6)
  -j <jail_path>   : use <jail_path> as chroot path (default: /var/empty/)
                     only available when running with super-user privileges
  -l <address>     : listen on local address <address>
  -m <a1>=<a2>     : map address <a1> to <a2> when sending it to clients
                     addresses can contain a port number (ex: myaddr.net:1234)
  -n <max_servers> : maximum number of servers recorded (default: 256)
  -p <port_num>    : use port <port_num> (default: 27950)
  -u <user>        : use <user> privileges (default: nobody)
                     only available when running with super-user privileges
  -v [verbose_lvl] : verbose level, up to 4 (default: 3; no value means max)


CREDITS
=======
Based on DPMASTER for Dark Places and Quake3
http://icculus.org/twilight/darkplaces/download.html




TREPDIATION PROJECT: http://trepidation.sourceforge.net

