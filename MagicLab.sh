 #! /bin/bash

echo "░█▄█░█▀█░█▀▀░▀█▀░█▀▀░█░░░█▀█░█▀▄
░█░█░█▀█░█░█░░█░░█░░░█░░░█▀█░█▀▄
░▀░▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀░
"
#Res, RAM, OS, GPU, CPU, Storage

#resolution
res=`xdpyinfo | awk '/dimensions/{print $2}'`
echo -e "\e[35mResolution\e[0m -- ${res##*:}"

# Ram
MEM=`free -m  | grep Mem | awk '{print $2}'`
echo -e "\e[35mRam\e[0m --  $MEM MB"

#GPU
GPU=`DRI_PRIME=1 glxinfo -B | grep renderer`
# echo "GPU -- ${GPU##*:}"
echo -e "\e[35mGPU\e[0m -- ${GPU##*:}"

#CPU
CPU=`cat /proc/cpuinfo | sed '5!d'`
CPU=${CPU##*:}
echo -e "\e[35mCPU\e[0m -- $CPU"

#OS
OS=`hostnamectl`
OS=${OS%Kernel*}
OS=${OS##*System}
OS=${OS#* }
echo -e "\e[35mOS\e[0m --  $OS"
