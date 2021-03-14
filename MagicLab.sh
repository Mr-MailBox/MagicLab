 #! /bin/bash

echo "░█▄█░█▀█░█▀▀░▀█▀░█▀▀░█░░░█▀█░█▀▄
░█░█░█▀█░█░█░░█░░█░░░█░░░█▀█░█▀▄
░▀░▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀░
"
#Res, RAM, OS, GPU, CPU, Storage

# storage
# maindrive=`df -h /`
# used=${maindrive##*on} 
# used=${maindrive##*       } 
# echo -e "\e[35mStorage\e[0m --  using $used out of $size"

#resolution
res=`xdpyinfo | awk '/dimensions/{print $2}'`
echo -e "\e[35mResolution\e[0m -- ${res##*:}"

# Ram
MEM=`free -m  |awk '/^Mem:/ {print $3 " MB/" $2}'`
echo -e "\e[35mRam\e[0m --  $MEM MB"

#GPU
GPU=`DRI_PRIME=1 glxinfo -B | grep renderer`
echo -e "\e[35mGPU\e[0m -- ${GPU##*:}"

#CPU
CPU=`grep 'model name' /proc/cpuinfo`
CPU=${CPU##*:}
echo -e "\e[35mCPU\e[0m -- $CPU"

#OS
OS=`hostnamectl`
OS=${OS%Kernel*} #everything after and including "Kernel" gets deleted
OS=${OS##*System} #everything before and including "System" gets deleted
OS=${OS#* }
echo -e "\e[35mOS\e[0m --  $OS"










