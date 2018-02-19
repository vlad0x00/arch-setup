#!/bin/bash

i3-msg -t get_workspaces | jq -j '.[] | select(.rect.x | contains(0)) | if .visible == true then "<span bgcolor=\"#000000FF\">"+" "+.name+" "+"</span>" else " "+.name+" " end'
