#!/usr/bin/bash
tomcat_version=$1
tomcat_major_v=$(echo $tomcat_version | cut -c 1)
url="https://downloads.apache.org/tomcat/tomcat-${tomcat_major_v}/v${tomcat_version}/bin/apache-tomcat-${tomcat_version}.tar.gz"
rm -rf apache-tomcat-${tomcat_version}.tar.gz.*
wget $url
#wget "https://downloads.apache.org/tomcat/tomcat-8/v8.5.56/bin/apache-tomcat-8.5.56.tar.gz"
tar -xzvf apache-tomcat-${tomcat_version}.tar.gz
mv apache-tomcat-${tomcat_version} tomcat${tomcat_major_v}
rm -rf apache-tomcat-${tomcat_version}.tar.gz
