#!/bin/bash

## This bash script reads a list of usernames and passwords from a file
## and adds the users with the given password
##
## We expect the format of the file to be like this:
## <username> <password>\n

while read us
do
    uname="$(cut -d' ' -f1 <<<"$us")"
    pword="$(cut -d' ' -f2 <<<"$us")"
    useradd -rm -d /home/$uname -p "$(openssl passwd -1 $pword)" $uname
    # cp -R /code/jedi-colombia-project /home/$uname/
    cd /home/$uname
    git clone https://github.com/afg1/jedi-colombia-project-complete.git
    chown -R $uname:$uname jedi-colombia-project-complete
done < usersAndPasswords.txt