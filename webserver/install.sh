#!/bin/bash

DOWNLOAD_LINK=http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.12/bin/apache-tomcat-7.0.12.tar.gz
TOMCAT=apache-tomcat-7.0.12

cd $(dirname $0)

if [ -e $TOMCAT ]
then
  exit
fi

# Setup tomcat
wget $DOWNLOAD_LINK
tar -xvf $TOMCAT.tar.gz
rm $TOMCAT.tar.gz

# Configure cgi-bin
cp etc/*.xml $TOMCAT/conf/
rm -rf $TOMCAT/webapps/*
cp -r etc/ROOT $TOMCAT/webapps/

