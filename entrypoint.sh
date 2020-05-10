#!/usr/bin/env bash

build_vpnc_conf > /etc/vpnc/config.conf

vpnc config

sleep 4

curl ip-api.com?fields=query

