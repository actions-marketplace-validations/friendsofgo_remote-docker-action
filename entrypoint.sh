#!/bin/sh -l

# Pulls alpine:latest Docker image (remotely)
docker -H $INPUT_HOSTADDRESS --tls --tlscacert=$INPUT_CACERT --tlscert=$INPUT_SERVERCERT --tlskey=$INPUT_SERVERKEY pull alpine:latest