#!/bin/sh -l

# Managing secrets
SECRETS_DIR="$HOME/certs"

CA_CERT_FILE="$SECRETS_DIR/ca.pem"
SERVER_CERT_FILE="$SECRETS_DIR/server.pem"
SERVER_KEY_FILE="$SECRETS_DIR/server.key"

# Registering secrets from env
mkdir -p $SECRETS_DIR

printf '%s' "$INPUT_CACERT" > $CA_CERT_FILE
printf '%s' "$INPUT_SERVERCERT" > $SERVER_CERT_FILE
printf '%s' "$INPUT_SERVERKEY" > $SERVER_KEY_FILE

# Log into Docker registry
if ! [ -z "$REGISTRY_PASS" ] && ! [ -z "$REGISTRY_USER" ] ; then
  echo $REGISTRY_PASS | docker -H $INPUT_HOSTADDRESS --tls --tlscacert=$CA_CERT_FILE --tlscert=$SERVER_CERT_FILE --tlskey=$SERVER_KEY_FILE login https://docker.pkg.github.com -u $REGISTRY_USER --password-stdin
fi

# Pulls alpine:latest Docker image (remotely)
docker-compose -H $INPUT_HOSTADDRESS --tls --tlscacert=$CA_CERT_FILE --tlscert=$SERVER_CERT_FILE --tlskey=$SERVER_KEY_FILE pull