#!/bin/bash

url=$1

output=$(curl -w "\nhttp_code=%{http_code}\nssl_handshake=%{time_appconnect}\ntcp_connection=%{time_connect}\ndns_lookup=%{time_namelookup}\nstart_transfer=%{time_starttransfer}\ntotal_time=%{time_total}\n" $url -so /dev/null 2>&1)
http_code=$(echo "$output" | awk '/http_code/ {split($1,a,"="); print a[2]}')
dns_lookup=$(echo "$output" | awk '/dns_lookup/ {split($0,a,"="); print a[2]*1000}')
tcp_connection=$(echo "$output" | awk "/tcp_connection/ {split(\$0,a,\"=\"); print a[2]*1000 - $dns_lookup}")
ssl_handshake=$(echo "$output" | awk "/ssl_handshake/ {split(\$0,a,\"=\"); b = (a[2]*1000 - ($dns_lookup + $tcp_connection)); print(b<0?0:b)}")
start_transfer=$(echo "$output" | awk "/start_transfer/ {split(\$0,a,\"=\"); print a[2]*1000 - ($dns_lookup + $tcp_connection + $ssl_handshake)}")
total_time=$(echo "$output" | awk "/total_time/ {split(\$0,a,\"=\"); print a[2]*1000}")
request_time=$(echo "" | awk "{print $total_time - ($dns_lookup + $tcp_connection + $ssl_handshake + $start_transfer)}")

echo "        DNS Lookup: ${dns_lookup}ms"
echo "    TCP Connection: ${tcp_connection}ms"
echo "     SSL Handshake: ${ssl_handshake}ms"
echo "Time to First Byte: ${start_transfer}ms"
echo "       Server Time: ${request_time}ms"
echo "             Total: ${total_time}ms"
