#!/bin/bash
sudo yum install -y https://archive.cloudera.com/cdh5/one-click-install/redhat/7/x86_64/cloudera-cdh-5-0.x86_64.rpm
sudo yum install zookeeper -y
sudo systemctl daemon-reload
sudo systemctl start zookeeper
sudo systemctl enable zookeeper
