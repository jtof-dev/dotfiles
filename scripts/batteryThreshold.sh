#!/bin/bash

sudo bat-asus-battery threshold $1

sudo bat-asus-battery persist

echo "battery threshold level set to $1"
