#!/usr/bin/env bash
ps -ef | grep licenseVerify | grep -v grep | cut -c 9-15 | xargs kill -9
