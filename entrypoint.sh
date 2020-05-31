#!/bin/sh -l

# Pulls alpine:latest Docker image (remotely)
docker -H $INPUT_HOST_ADDRESS --tls --tlscacert=$INPUT_CA_CERT --tlscert=$INPUT_SERVER_CERT --tlskey=$INPUT_SERVER_KEY pull alpine:latest