# Pipe command to clipboard. c <cmd>
c(){
  "$@" | pbcopy
}

function co {
  proj=$(ls -d *.xcodeproj/ 2>/dev/null)

  if [ -n "$proj" ]; then
    open -a Xcode "$proj"
  else
    echo "No Xcode project detected."
  fi
}

ram() {
  local sum
  local items
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
      sum=$(($i + $sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
}
