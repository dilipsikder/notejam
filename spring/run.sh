#!/bin/sh

# Start the proxy
./cloud_sql_proxy -instances=notejam1:mysql1=tcp:3306 

# wait for the proxy to spin up
sleep 10

# Start the server
./server





