#!/usr/bin/env bash

percent=$(
    df -H / | grep -vE '^Sys' | awk '{ print $5}' 
    )

remaining=$(
    df -H / | grep -vE '^Sys' | awk '{ print $4}' 
    )
echo "$percent • $remaining"
