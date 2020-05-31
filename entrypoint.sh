#!/bin/sh -l

# Managing secrets
SECRETS_DIR="$HOME/certs"

CA_CERT_FILE="$SECRETS_DIR/ca.pem"
SERVER_CERT_FILE="$SECRETS_DIR/server.pem"
SERVER_KEY_FILE="$SECRETS_DIR/server.key"

# Registering secrets from env
printf '%s' "$INPUT_CACERT" > $CA_CERT_FILE
printf '%s' "$INPUT_SERVERCERT" > $SERVER_CERT_FILE
printf '%s' "$INPUT_SERVERKEY" > $SERVER_KEY_FILE

# Pulls alpine:latest Docker image (remotely)
docker -H $INPUT_HOSTADDRESS --tls --tlscacert=$CA_CERT_FILE --tlscert=$SERVER_CERT_FILE --tlskey=$SERVER_KEY_FILE pull alpine:latest