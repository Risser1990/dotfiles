function blk
    lsblk -o NAME,SIZE,TYPE,MOUNTPOINTS,LABEL,UUID -e 7 -f | awk '
            BEGIN {
              cyan="\033[1;36m"; yellow="\033[1;33m"; green="\033[32m"
              blue="\033[34m"; magenta="\033[35m"; red="\033[31m"
              reset="\033[0m"; bold="\033[1m"
            }
            NR==1 {
              # Color the header
              print bold cyan $0 reset
              next
            }
            {
              # Color entire rows based on device type
              if ($0 ~ /disk/) print yellow $0 reset
              else if ($0 ~ /part/) print green $0 reset
              else if ($0 ~ /crypt/) print magenta $0 reset
              else if ($0 ~ /lvm/) print blue $0 reset
              else print $0
            }
          '
end
