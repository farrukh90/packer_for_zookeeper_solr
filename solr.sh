#!/bin/bash
sudo yum install java-1.8.0-openjdk wget lsof -y
sudo wget https://www-eu.apache.org/dist/lucene/solr/7.5.0/solr-7.5.0.tgz -P /tmp
sudo tar xzvf /tmp/solr-7.5.0.tgz  -C /tmp
sudo bash /tmp/solr-7.5.0/bin/install_solr_service.sh  /tmp/solr-7.5.0.tgz
sudo systemctl start solr
sudo systemctl enable solr

