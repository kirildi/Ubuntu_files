#!/bin/bash

###
#
#  Script for upgrading Jenkins 
#  Date created: 09.11.2021
#
#  To run use 'sudo /path/to/sript/jenkins_upgrade.bash' and provide the url of the "war" file
#  Example: sudo /home/username/linux_scripts/jenkins_upgrade.bash https://updates.jenkins.io/download/war/2.397/jenkins.war
#
###
JENKINS_DIR=/usr/share/jenkins
JENKINS_DOWNLOAD_URL=$1
if [ ! $JENKINS_DOWNLOAD_URL ]; then
     echo "Provide the jenkins war download url"
     exit
fi

cd $JENKINS_DIR
echo "Working directory is:"
pwd
sudo service jenkins stop
sudo rm -rf jenkins.*.old
sudo mv jenkins.war jenkins.war.old
sudo wget $JENKINS_DOWNLOAD_URL
sudo service jenkins start
echo "Jenkins upgraded!"
