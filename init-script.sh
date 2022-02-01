#!/bin/bash
sudo chown -R ec2-user /var/log/
cd /var/log/
sudo dir > DataOfUploaded.txt

aws configure set region eu-north-1
aws s3 cp --recursive /var/log/. s3://endija-spainis
aws configure list