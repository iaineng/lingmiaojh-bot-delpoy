#! /bin/bash

echo "start install."
echo "1/5 enviroment check..."

if [ "$(id -u)" != "0" ]; then
    echo "Error: You must be root to run this script."
    exit 1
fi

if [ -f "installed" ]; then
    echo "installed file exists, exit."
    exit 1
fi

echo ""
echo "2/5 dependency install..."

if ! apt-get update; then
    echo "Error: apt-get update failed."
    exit 1
fi

if ! apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common; then
    echo "Error: apt-get install failed."
    exit 1
fi

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list >/dev/null

if ! apt-get update; then
    echo "Error: apt-get update failed."
    exit 1
fi

if ! apt-get install -y tar docker-ce docker-ce-cli containerd.io docker-compose-plugin; then
    echo "Error: apt-get install failed."
    exit 1
fi

echo ""
echo "3/5 extract data..."

if [ ! -d "app-db" ]; then
    echo "Error: app-db not found."
    exit 1
fi
if [ ! -d "app-db/data" ]; then
    if ! ./extract.sh; then
        echo "Error: extract.sh failed."
        exit 1
    fi
fi

echo ""
echo "4/5 start docker..."

systemctl enable docker
systemctl start docker

mkdir -p /etc/docker/
# if [ ! -f "/etc/docker/daemon.json" ]; then
#     touch /etc/docker/daemon.json
#     cat >/etc/docker/daemon.json <<EOF
# {
#   "registry-mirrors": [
#     "https://hub-mirror.c.163.com",
#     "https://mirror.baidubce.com"
#   ],
#   "data-root": "/mnt/data/docker"
# }
# EOF

#     systemctl daemon-reload
#     systemctl restart docker
# fi
if [ ! -f "/etc/docker/daemon.json" ]; then
    touch /etc/docker/daemon.json
    cat >/etc/docker/daemon.json <<EOF
{
  "data-root": "/mnt/data/docker"
}
EOF

    systemctl daemon-reload
    systemctl restart docker
fi

echo ""
echo "5/5 done."

touch installed
