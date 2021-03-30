#!/bin/bash

firewall-cmd --permanent --add-masquerade
firewall-cmd --permanent --direct --add-rule ipv4 nat POSTROUTING 0 -o eth0 -j MASQUERADE
firewall-cmd --direct --permanent --add-rule ipv4 filter FORWARD 0 -i bond0 -o eth0 -j ACCEPT
firewall-cmd --direct --permanent --add-rule ipv4 filter FORWARD 0 -i eth0 -o bond0 -m state --state RELATED,ESTABLISHED -j ACCEPT
firewall-cmd --reload