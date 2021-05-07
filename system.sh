#!/bin/bash
printline() { tput setaf 3; echo "---------------------------------------------------------"; tput sgr0; };
ip=$(ifconfig eth0 | grep inet | awk '{ print $2 }');
echo "";
printline;
tput setaf 3; echo "                   System monitor"; tput sgr0;
printline;
echo "";
echo -e "\e[1mActual user:\e[0m\e[1;31m"  $USER "\e[0m";
echo -e  "\e[1mNetwork:\e[0m\e[1;34m    "  $ip;
echo -e  "\e[0m"
printline;
echo "";
echo -e  "\e[1mLast logins:\e[0m";
echo "";
last -3 | head -3 | cut -c 21-;
echo "";
printline;
echo "";
echo -e  "\e[1mDisk use:\e[0m";
echo "";
df -h;
echo "";
printline;
echo "";
echo "Cleaning memory...";
echo "";
echo 1 > /proc/sys/vm/drop_caches;
echo 2 > /proc/sys/vm/drop_caches;
echo 3 > /proc/sys/vm/drop_caches;
echo -e  "\e[1mMemory usage:\e[0m";
echo "";
free -m | head -1 | awk '{print "          " $1 "  " $2 "  " $3}';
free -m | grep Mem | awk '{print "          "$2"    "$3"   "$4}';
echo "";
printline;
echo "";
echo -e  "\e[1mProcesses:\e[0m";
echo ""
ps;
echo "";
printline;
printline;
echo "";
exit;
