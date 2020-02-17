#!/bin/sh

rsync -avt --delete /opt/build/tmp-glibc/deploy/ /opt/deploy
