sudo yum install java-1.8.0-openjdk
sudo groupadd zookeeper
sudo useradd -g zookeeper -d /opt/zookeeper -s /sbin/nologin zookeeper
sudo cd /opt
sudo curl -O http://apache.spinellicreations.com/zookeeper/zookeeper-3.4.13/zookeeper-3.4.13.tar.gz
sudo tar xzf zookeeper-3.4.10.tar.gz
sudo mv zookeeper-3.4.13 zookeeper
sudo cd zookeeper
sudo mkdir data
sudo chown -R zookeeper:zookeeper /opt/zookeeper/*
sudo cat > /opt/zookeeper/conf/zoo.cfg  <<EOF
tickTime=2000
initLimit=10
syncLimit=5
dataDir=/opt/zookeeper/data
clientPort=2181
EOF

sudo cat > /usr/lib/systemd/system/zookeeper.service <<EOF
[Unit]
Description=Zookeeper Service
 
[Service]
Type=simple
WorkingDirectory=/opt/zookeeper/
PIDFile=/opt/zookeeper/data/zookeeper_server.pid
SyslogIdentifier=zookeeper
User=zookeeper
Group=zookeeper
ExecStart=/opt/zookeeper/bin/zkServer.sh start
ExecStop=/opt/zookeeper/bin/zkServer.sh stop
Restart=always
TimeoutSec=20
SuccessExitStatus=130 143
Restart=on-failure
 
[Install]
WantedBy=multi-user.target
EOF
sudo systemctl daemon-reload
sudo systemctl enable zookeeper.service
sudo systemctl start zookeeper.service
