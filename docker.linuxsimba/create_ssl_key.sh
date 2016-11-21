#!/bin/bash

openssl genrsa -des3 -passout pass:yourpassword -out server.key 2048
openssl rsa -in server.key -out server.key.insecure -passin pass:yourpassword
mv server.key server.key.secure
mv server.key.insecure server.key

openssl req -new -key server.key -out server.csr -subj "/C=US/ST=NC/L=Durham/O=Personal Security/OU=IT OPS/CN=securitymonkey.com"
openssl x509 -req -days 365  -in server.csr -signkey server.key -out server.crt

cp server.crt /etc/ssl/certs
cp server.key /etc/ssl/private

