#!/bin/bash

i3-msg -t get_workspaces | jq -j '.[] | select(.rect.x | contains(0)) | if .visible == true then "<span bgcolor=\"#00000055\">"+" "+.name+" "+"</span>" else " "+.name+" " end'
