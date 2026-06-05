#!/usr/bin/env bash

iwctl station wlan0 scan 
sleep 1
iwctl station wlan0 connect zs
