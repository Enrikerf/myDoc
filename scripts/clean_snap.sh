!/bin/bash
 #Removes old revisions of snaps
 #CLOSE ALL SNAPS BEFORE RUNNING THIS
 # https://www.linuxuprising.com/2019/04/how-to-remove-old-snap-versions-to-free.html
 # https://unix.stackexchange.com/questions/590319/is-it-safe-to-delete-these-snaps
 set -eu
 LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
     while read snapname revision; do
         snap remove "$snapname" --revision="$revision"
     done
#https://www.debugpoint.com/2021/03/clean-up-snap
# sudo snap set system refresh.retain=2

