#! /bin/bash

# cat >/etc/apt/sources.list <<EOF
# deb http://mirrors.ustc.edu.cn/debian/ bullseye main contrib non-free
# deb-src http://mirrors.ustc.edu.cn/debian/ bullseye main contrib non-free
# deb http://mirrors.ustc.edu.cn/debian/ bullseye-updates main contrib non-free
# deb-src http://mirrors.ustc.edu.cn/debian/ bullseye-updates main contrib non-free
# deb http://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free
# deb-src http://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free
# EOF

mkdir -p /etc/apt/sources.list.d

cat >/etc/apt/sources.list.d/backports.list <<EOF
deb http://mirrors.ustc.edu.cn/debian/ bullseye-backports main
deb-src http://mirrors.ustc.edu.cn/debian/ bullseye-backports main contrib non-free
EOF
