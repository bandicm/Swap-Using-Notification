# Swap-Using-Notification
The script that checks the use of SWAP, when it exceeds the defined percentage, notifies the user via KDE Plasma notifications.

When the user uses RAM and when the linux system starts writing to SWAP the system slows down. To ensure comfortable operation and avoid overloading SWAP. The script checks the extent to which the SWAP is filled and notifies the user when it exceeds 20%. The user then closes unused programs to free memory.

The script uses KDE Plasma Notifications, I believe it can be done for another DE.

This way I avoided my system freezing when I run out of RAM and not noticing how the system saves things in SWAP which is slow. Now I can react much earlier and maintain continuity in work.

You need to have the libnotify-bin package installed

sudo apt-get install libnotify-bin

<img src="/Swap-Using-Notification/blob/main/Screenshot_20220421_092646.png" alt="Screenshot" title="Screenshot">
