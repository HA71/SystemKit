#!/bin/bash
echo ""
ip=$(ifconfig | grep -A 1 'ens3' | tail -1 | cut -d ' ' -f 10)
echo "\e[1;33m------------------------------------------------------"
echo "                   System monitor"
echo "------------------------------------------------------\e[0m"
echo ""
echo "\e[1mActual user:\e[0m\e[1;31m"  $USER "\e[0m"
echo "\e[1mNetwork:\e[0m\e[1;34m    "  $ip
echo "\e[0m"
echo "\e[1;33m------------------------------------------------------\e[0m"
echo ""
echo "\e[1mLast logins:\e[0m"
echo ""
last -3 | head -3 | cut -c 21-
echo ""
echo "\e[1;33m------------------------------------------------------\e[0m"
echo ""
echo "\e[1mDisk use:\e[0m"
echo ""
df -h
echo ""
echo "\e[1;33m------------------------------------------------------\e[0m"
echo ""
echo "Cleaning memory..."
echo ""
echo 1 > /proc/sys/vm/drop_caches
echo 2 > /proc/sys/vm/drop_caches
echo 3 > /proc/sys/vm/drop_caches
echo "\e[1mMemory usage:\e[0m"
echo ""
free -m | head -1 | awk '{print "          " $1 "  " $2 "  " $3}'
free -m | grep Mem | awk '{print "          "$2"    "$3"   "$4}'
echo ""
echo "\e[1;33m------------------------------------------------------\e[0m"
echo ""
echo "\e[1mProcesses:\e[0m"
echo ""
ps
echo ""
echo "\e[1;33m------------------------------------------------------\e[0m"
echo "\e[1;33m------------------------------------------------------\e[0m"
echo ""