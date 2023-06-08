#!/bin/bash
# Connect to the EC2 instance
ssh -i pemkey-seleniumtest.pem ubuntu@ec2-13-235-242-87.ap-south-1.compute.amazonaws.com << EOF
sudo apt-get update
sudo apt-get install openjdk-11-jdk
java -version
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
echo "Y" | sudo apt-get update
echo "Y" | sudo apt-get install fontconfig openjdk-11-jre
echo "Y" | sudo apt-get install jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

EOF
