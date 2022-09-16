#!/bin/bash

	# Author: Mikkel 
	# Date: June 15th, 2022
	# Description:  Jenkins installation package

echo "Your Jenkins installation will begin now."

sleep 2

sudo yum install java-11-openjdk -y

if
 [ $? -ne 0]
 then 
 echo "Java installation failed. Please read the error and try again."
 exit 2
 fi

#Enable Jenkins repository

sudo yum install wget -y

if 
 [ $? -ne 0 ]
 then
 echo "Wget installation failed. Please read the error and try again."
 exit 3
 fi

sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo 

sudo sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo

sudo yum install jenkins -y
if 
 [ $? -ne 0 ]
 then 
 echo "Jenkins installation failed. Please read the error message and try again"
exit 4
fi
sudo systemctl start jenkins 

sudo systemctl status jenkins

sudo systemctl enable jenkins 

#Firewall Adjustment

 sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp 

 sudo firewall-cmd --reload

ifconfig | grep broadcast | awk '{print $2}'

echo "Launch your google chrome browser and type the IP address displayed followed by the port number 8080"

echo "Example http://your_ip_or_domain:8080"

sleep 200

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "Copy the 32-character long alphanumeric password displayed into the Administrator password field in the page you have in the browser. Then click on Conitune"

sleep 3

echo "On the screen Customize Jenkins, click on the install suggested plugins box and the installation process will start."

sleep 30

echo "When the installation will be completed, you will get a form to create the First Admin User. Fill out the form"

echo "Username: utrains"

echo "Password: school"

echo "E-mail address: use your own email address"

sleep 5

# Instance Configuration

echo "On the next page you will need to set the URL for the Jenkins instance. The Jenkins URL field will come with a default value (automatically generated). Just click on Save and Finish"

sleep 3

echo "Jenkins is now ready for use! Click on Start using Jenkins button and you will be automatically redirected to the Jenkins dashboard."

sleep 1