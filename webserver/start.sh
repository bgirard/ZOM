#!/bin/bash

DOWNLOAD_LINK=http://apache.raffsoftware.com/tomcat/tomcat-7/v7.0.12/bin/apache-tomcat-7.0.12.tar.gz
TOMCAT=apache-tomcat-7.0.12

cd $(dirname $0)

$TOMCAT/bin/startup.sh

