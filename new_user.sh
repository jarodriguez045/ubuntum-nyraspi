#!/bin/bash

#RUN THIS SCRIPT AS SUDO

#Admin Input
echo "What is the users full name?"
read FULL_NAME
echo $FULL_NAME

echo "What is the desired username?"
read USER
echo $USER

echo "Is this person a super user? (y/n)"
read SUPERU
echo $SUPERU

if [$SUPERU != "y"]
then 
    echo "Is this person an admin? (y/n)"
    read USRADM
elif [$SUPERU != "y" && $USRADM != "y"]
then
    echo "Is this person a developer? (y/n)"
    read UDEV
fi

#Create the user account
useradd -mc "$Full_Name" $USER
passwd $USER

#Add to groups
if [$SUPERU == "y"]
then 
    usermod -aG root,sudo,Rodr_Admin,Rodr_Dev,adm,video,input,spi,i2c,gpio $USER
elif [$USRADM == "y"]
then 
    usermod -aG Rodr_Admin,adm,Rodr_Dev,video,input,spi,i2c,gpio $USER
elif [$UDEV == "y"]
then
    usermod -aG Rodr_Dev,video,input,spi,i2c,gpio $USER 
elif [$SUPERU != "y" && $USRADM != "y" && $UDEV != "y"]
then
    usermod -aG video,input,spi,i2c,gpio $USER
fi

#Variables
#USER_HOME is user home directory
USER_HOME=/home/$USER

#Create Directories
if [$SUPERU == "y" || $USRADM == "y" && $UDEV != "y"]
then
    cp -r /home/j_rodriguez/bin $USER_HOME
    cp -r /home/j_rodriguez/Developer $USER_HOME
    mkdir $USER_HOME/Desktop
    mkdir $USER_HOME/Documents
    mkdir $USER_HOME/Downloads
    mkdir $USER_HOME/Music
    mkdir $USER_HOME/Pictures
    mkdir $USER_HOME/Public
    mkdir $USER_HOME/Templates
    mkdir $USER_HOME/Videos
elif [$SUPERU != "y" && $USRADM != "y" && $UDEV == "y"]
then
    cp -r /home/j_rodriguez/Developer $USER_HOME
    mkdir $USER_HOME/Desktop
    mkdir $USER_HOME/Documents
    mkdir $USER_HOME/Downloads
    mkdir $USER_HOME/Music
    mkdir $USER_HOME/Pictures
    mkdir $USER_HOME/Public
    mkdir $USER_HOME/Templates
    mkdir $USER_HOME/Videos
elif [$SUPERU != "y" && $USRADM != "y" && $UDEV != "y"]
then
    mkdir $USER_HOME/Desktop
    mkdir $USER_HOME/Documents
    mkdir $USER_HOME/Downloads
    mkdir $USER_HOME/Music
    mkdir $USER_HOME/Pictures
    mkdir $USER_HOME/Public
    mkdir $USER_HOME/Templates
    mkdir $USER_HOME/Videos
fi

#Generate a ssh-key https://linuxize.com/post/how-to-set-up-ssh-keys-on-ubuntu-1804/

