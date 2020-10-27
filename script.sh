#!bin/bash

if[["${UID}"-ne 0 ]]
then
echo "Please run with sudo or as root"
exit 1
fi

#Get the username (login)
read -p "Enter the name of the person" COMMENT

#Get the password
read -p "Enter the password" PASSWORD

#Create the account
useradd -c "${COMMENT}" -M {USER_NAME}

#Check to seeif the useradd command succeded
if[["${?}"-ne 0 ]]
then
echo "Te account could not be created"
exit 1
fi

#Set the password
echo ${PASSWORD}| passwd--stdin ${USER_NAME}
if[["${?}"-ne0]]
then
echo "The password could not be set"
fi

#Froce password change on first login
passwd-e ${USER_NAME}

#Display the username, password, and the host where user was created
echo "username:"
echo "${USER_NAME}"
echo "password:"
echo "${PASSWORD}"
echo "Host:"
echo "${HOSTNAME}"
exit0
