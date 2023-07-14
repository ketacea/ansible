# 部署示例

## POC部署

### Supervisor

```shell
./ansible-playbook.sh examples/poc/supervisor.yml -K -t install
./ansible-playbook.sh examples/poc/supervisor.yml -K -t config
./ansible-playbook.sh examples/poc/supervisor.yml -K -t start

# 说明, -K 表示目标主机在执行shell命令时，有些命令是以sudo执行的，所以要输入当前用户的密码，默认为123456，切换到sudo权限

# 重启、停止、卸载
./ansible-playbook.sh examples/poc/supervisor.yml -K -t restart
./ansible-playbook.sh examples/poc/supervisor.yml -K -t start
./ansible-playbook.sh examples/poc/supervisor.yml -K -t status
./ansible-playbook.sh examples/poc/supervisor.yml -K -t stop
./ansible-playbook.sh examples/poc/supervisor.yml -K -t uninstall
```

### MySQL

```shell
wget https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.33-linux-glibc2.17-x86_64-minimal.tar.xz -O /tmp/mysql-8.0.33.tar.xz
```

```shell
./ansible-playbook.sh examples/poc/mysql.yml -K -t install
./ansible-playbook.sh examples/poc/mysql.yml -K -t config
./ansible-playbook.sh examples/poc/mysql.yml -K -t start

# 重启、停止、状态、卸载
./ansible-playbook.sh examples/poc/mysql.yml -K -t restart
./ansible-playbook.sh examples/poc/mysql.yml -K -t start
./ansible-playbook.sh examples/poc/mysql.yml -K -t status
./ansible-playbook.sh examples/poc/mysql.yml -K -t stop
./ansible-playbook.sh examples/poc/mysql.yml -K -t uninstall
```

### KetaDB

+ 下载

```shell
wget https://phoenix-public-1312700048.cos.ap-shanghai.myqcloud.com/ketadb-release/1.2.2.x/ketadb/keta-v1.2.2.1-apps.tar.gz -O /tmp/keta-v1.2.2.1-apps.tar.gz
```

+ 三节点集群 - 安装、加载、启动

```shell
# 三节点部署
./ansible-playbook.sh examples/poc/ketadb.yml -K -t install
./ansible-playbook.sh examples/poc/ketadb.yml -K -t config
./ansible-playbook.sh examples/poc/ketadb.yml -K -t start

# 重启、停止、状态、卸载
./ansible-playbook.sh examples/poc/ketadb.yml -K -t restart
./ansible-playbook.sh examples/poc/ketadb.yml -K -t start
./ansible-playbook.sh examples/poc/ketadb.yml -K -t status
./ansible-playbook.sh examples/poc/ketadb.yml -K -t stop
./ansible-playbook.sh examples/poc/ketadb.yml -K -t uninstall
```

+ 单节点集群 - 安装、加载、启动

```shell
# 单节点部署
./ansible-playbook.sh examples/poc/ketadb-single.yml -K -t install
./ansible-playbook.sh examples/poc/ketadb-single.yml -K -t config
./ansible-playbook.sh examples/poc/ketadb-single.yml -K -t start

# 重启、停止、状态、卸载
./ansible-playbook.sh examples/poc/ketadb-single.yml -K -t restart
./ansible-playbook.sh examples/poc/ketadb-single.yml -K -t start
./ansible-playbook.sh examples/poc/ketadb-single.yml -K -t status
./ansible-playbook.sh examples/poc/ketadb-single.yml -K -t stop
./ansible-playbook.sh examples/poc/ketadb-single.yml -K -t uninstall
```
