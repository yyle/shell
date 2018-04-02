#!/bin/sh
sudo kill -9 $(ps aux | grep -v 'grep' | grep 'node' | awk '{print $2}')