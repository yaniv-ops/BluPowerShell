#!/bin/bash
# (@)/pw
# A simple password manager
# Type "pw new platform username password" to add to the list
# or just type "pw platform" to get a password details

# create a txt file under $HOME domain
# and add the path as a value to a variable

PASSWORD_LIST=~/.password_list

# if no command line parameters entered then inform the user the input is wrong

if [ $# -lt 1 ] ; then
	echo "You did not pass any information"
	 exit 1
fi

# did you want to add a new password to the list ?

if [ $1 == "new" ] ; then
	shift
	echo $* >> $PASSWORD_LIST
	echo "$* is added to the password database"
	exit 0
fi

# perhaps the file is empty and nothing has put in there yet
if [ ! -s $PASSWORD_LIST ] ; then
	echo "The password list is empty yet!"
	exit 1
else 
	grep -i -q "$*" $PASSWORD_LIST # search for the password
	if [ $? -ne 0 ] ; then # checks if anything was found
		echo "Sorry but that domain was not found"
	exit 1
	else
		grep -i "$*" $PASSWORD_LIST
	fi
fi
exit 0
	

