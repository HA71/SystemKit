#!/bin/bash
printline(){ tput setaf 3; echo "---------------------------------------------------------"; tput sgr0; }
echo "";
printline;
tput setaf 3; echo "                         SSH Audit"; tput sgr0;
printline;
echo "";
tput setaf 1; echo "                      Failed attemps"; tput sgr0;
echo "";
grep Failed /var/log/auth.log | awk '{print "    " $1 " " $2 "\t" $3 "\t" $11 "\t" $9 }' | tail;
echo "";
printline;
echo "";
tput setaf 2; echo "                    Succesfull attemps"; tput sgr0;
echo ""
grep Accepted /var/log/auth.log | awk '{print "    " $1 " " $2 "\t" $3 "\t" $11 "\t" $9 }' | tail;
echo "";
echo "";
printline;
echo "";
tput setaf 3; echo "                 Established connections"; tput sgr0;
echo "";
netstat -tnpa | grep 'ESTABLISHED.*sshd' | awk '{print "   "  $5 " " $6 " " $7 " " $8}';
echo "";
printline;
printline;
echo "";
exit;
