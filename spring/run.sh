#!/bin/sh

# Start the proxy
nohup ./cloud_sql_proxy -instances=notejam1:mysql1=tcp:3306 >/dev/null 2>&1 &

# wait for the proxy to spin up
sleep 10

/usr/bin/java -jar spring-0.0.1-SNAPSHOT.jar
