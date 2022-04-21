#!/bin/bash

: '
When the user uses RAM and when the linux system starts writing to SWAP the system slows down. To ensure comfortable operation and avoid overloading SWAP. The script checks the extent to which the SWAP is filled and notifies the user when it exceeds 20%. The user then closes unused programs to free memory.

The script uses KDE Plasma Notifications, I believe it can be done for another DE.

This way I avoided my system freezing when I run out of RAM and not noticing how the system saves things in SWAP which is slow. Now I can react much earlier and maintain continuity in work.

You need to have the libnotify-bin package installed

sudo apt-get install libnotify-bin
'

tolerant=5 # tolerancija korištenja

while [ true ]; do

    total_swap=$(grep SwapTotal /proc/meminfo  | awk '{print $2}')
    echo $total_swap
    free_swap=$(grep SwapFree /proc/meminfo  | awk '{print $2}')
    echo $free_swap
    usage_percent=$((total_swap-free_swap))
    echo $usage_percent
    ((usage_percent*=100))
    echo $usage_percent
    ((usage_percent/=total_swap))
    echo $usage_percent
    
    if (( usage_percent \> tolerant )); then
    
        notify-send 'The system started using SWAP. Close unnecessary programs for safe operation.'

    fi
    sleep 1m
    
done



