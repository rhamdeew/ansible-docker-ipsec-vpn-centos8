#!/bin/bash

echo "VPN_IPSEC_PSK=`pwgen 12 1`
VPN_USER=vpnclient
VPN_PASSWORD=`pwgen 12 1`" > vpn.env
