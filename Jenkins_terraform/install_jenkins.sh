#!/bin/bash
sudo perl -pi -e 's/^#?Port 22$/Port 2222/' /etc/ssh/sshd_config
sudo service sshd restart || sudo service ssh restart
sudo yum update –y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
sudo aws ecr get-login-password --region eu-west-1 | sudo docker login --username AWS --password-stdin aws_id.dkr.ecr.eu-west-1.amazonaws.com
sudo docker pull aws_id.dkr.ecr.eu-west-1.amazonaws.com/jenkinstaskimage:jcasc
sudo docker run -d --restart always --name jenkins -p 8080:8080 --env JENKINS_ADMIN_ID=admin --env JENKINS_ADMIN_PASSWORD=password aws_id.dkr.ecr.eu-west-1.amazonaws.com/jenkinstaskimage:jcasc

