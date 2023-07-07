# 自动化部署

## 介绍
本项目，用于快速部署和管理ketadb平台

## 准备环境

+ 使用docker-compose创建测试环境，用于测试环节，如果有远端机器，则跳过

```shell
make docker-create

# 清理命令
make docker-clean
```

+ 使用物理机作为测试环境，例如: ubuntu

```shell
sed -i 's/archive.ubuntu.com/mirrors.cloud.tencent.com/g' /etc/apt/sources.list 
sed -i 's/security.ubuntu.com/mirrors.cloud.tencent.com/g' /etc/apt/sources.list 
export DEBIAN_FRONTEND=noninteractive 
apt update 
apt install sudo systemctl vim python2 libaio1 libnuma1 libtinfo5 libncurses5 ssh -y 
cp /usr/bin/python2 /usr/bin/python 
ssh-keygen -A 
service ssh start 
systemctl enable ssh 
mkdir -p /home/keta/.ssh 
useradd keta -d /home/keta 
echo keta:123456 | chpasswd 
chown -R keta:keta /home/keta 
echo 'keta    ALL=(ALL:ALL) ALL' >> /etc/sudoers
```

## Ansible

```shell
# 默认支持linux
make ansible-install

# mac环境安装如下
make ansible-mac-install 
```

## Supervisor + MySQL

```shell
wget https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.33-linux-glibc2.17-x86_64-minimal.tar.xz -O /tmp/mysql-8.0.33.tar.xz
```

```shell
./ansible-playbook.sh examples/poc/base-install.yml -t install -K

# 重启、停止
./ansible-playbook.sh examples/poc/base-install.yml -t restart -K
./ansible-playbook.sh examples/poc/base-install.yml -t start -K
./ansible-playbook.sh examples/poc/base-install.yml -t stop -K
```

## KetaDB

+ 下载

```shell
wget https://phoenix-public-1312700048.cos.ap-shanghai.myqcloud.com/ketadb-release/1.2.2.x/ketadb/keta-v1.2.2.1-apps.tar.gz -O /tmp/keta-v1.2.2.1-apps.tar.gz
```

+ 安装、加载、启动

```shell
./ansible-playbook.sh examples/poc/ketadb-install.yml -t install -K
./ansible-playbook.sh examples/poc/ketadb-install.yml -t start

# 重启、停止、状态
./ansible-playbook.sh examples/poc/ketadb-install.yml -t restart
./ansible-playbook.sh examples/poc/ketadb-install.yml -t stop
./ansible-playbook.sh examples/poc/ketadb-install.yml -t status
```
