export DEBIAN_FRONTEND=noninteractive
localedef -i en_US -f UTF-8 en_US.UTF-8
apt-get -qq update
apt-get -qq install --no-install-recommends -y \
  wget curl git vim jq mc net-tools less sudo  \
  ca-certificates netcat-traditional build-essential
useradd -m -s /bin/bash developer
echo 'developer ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers
echo 'Downloading JDK ...'
wget --no-check-certificate --no-cookies                         \
     --header "Cookie: oraclelicense=accept-securebackup-cookie" \
     -qO /opt/jdk.tgz                                            \
         http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.tar.gz
echo 'Extracting JDK ...'
tar -xf /opt/jdk.tgz -C /opt
rm /opt/jdk.tgz
mv /opt/jdk* /opt/jdk
echo 'Downloading ElasticSearch ...'
URL="https://download.elastic.co"
ES="elasticsearch"
V="2.4.1"
wget -qO /opt/elasticsearch.tgz \
         ${URL}/${ES}/release/org/${ES}/distribution/tar/${ES}/${V}/${ES}-${V}.tar.gz
echo 'Extracting ElasticSearch ...'
cd /opt
tar -xf /opt/elasticsearch.tgz -C /opt
rm /opt/elasticsearch.tgz
mv /opt/elasticsearch* /opt/elasticsearch
echo 'Downloading Kibana ...'
URL="https://download.elastic.co"
V="4.6.1"
wget -qO /opt/kibana.tgz \
         ${URL}/kibana/kibana/kibana-${V}-linux-x86_64.tar.gz
echo 'Extracting Kibana ...'
cd /opt
tar -xf /opt/kibana.tgz -C /opt
rm /opt/kibana.tgz
mv /opt/kibana* /opt/kibana
echo 'Downloading Neo4J ...'
URL="http://dist.neo4j.org"
V="3.0.7"
wget -qO /opt/neo4j.tgz \
         ${URL}/neo4j-community-${V}-unix.tar.gz
echo 'Extracting Neo4J ...'
cd /opt
tar -xf /opt/neo4j.tgz -C /opt
rm /opt/neo4j.tgz
mv /opt/neo4j-* /opt/neo4j
cd /opt
git clone https://github.com/dserban/DockerKibana.git
cd /opt/DockerKibana
cp elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml
cp neo4j.conf /opt/neo4j/conf/neo4j.conf
cp launcher.sh /usr/bin/
chmod +x /usr/bin/launcher.sh
chown -R developer /opt/elasticsearch
chown -R developer /opt/kibana
chown -R developer /opt/neo4j
echo 'Building container, this may take a while ...'
