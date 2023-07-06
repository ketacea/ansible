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

+ 安装本地ansible

```shell
# 默认支持linux
make ansible-install

# mac环境安装如下，待实现
make ansible-mac-install
```

+ 修改部署配置
  - nodes目录：配置主机与节点
  - vars目录：配置用户、版本、安装包


+ 安装远端supervisor

```shell
./ansible-playbook.sh tasks/supervisor.yml -K -t install,start

# 重启、停止
./ansible-playbook.sh tasks/supervisor.yml -K -t restart
./ansible-playbook.sh tasks/supervisor.yml -K -t stop
```

## MySQL

+ 下载

```shell
wget https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.33-linux-glibc2.12-x86_64.tar.xz -O /tmp/mysql-8.0.33.tar.xz
```

+ 安装、加载、启动

```shell
./ansible-playbook.sh tasks/mysql.yml -t install,reread,start

# 重启、停止、状态
./ansible-playbook.sh tasks/mysql.yml -t restart
./ansible-playbook.sh tasks/mysql.yml -t stop
./ansible-playbook.sh tasks/mysql.yml -t status
```

## KetaDB

+ 下载

```shell
wget https://[xishuhq-官网]/downloads/keta-v1.2.0-apps.tar.gz -O /tmp/keta-v1.2.0-apps.tar.gz
```

+ 安装、加载、启动

```shell
./ansible-playbook.sh tasks/ketadb.yml -t install,reread,start

# 重启、停止、状态
./ansible-playbook.sh tasks/ketadb.yml -t restart
./ansible-playbook.sh tasks/ketadb.yml -t stop
./ansible-playbook.sh tasks/ketadb.yml -t status
```
