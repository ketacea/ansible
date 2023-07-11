# 自动化部署

## 介绍
本项目，用于快速部署和管理ketadb平台

## 准备环境

+ 使用docker创建测试环境

```shell
make docker-create

# 清理命令
make docker-clean
```

## Ansible

```shell
# 默认支持linux
make ansible-install

# mac环境安装如下
make ansible-mac-install 
```

## Poc部署

POC环境，详细文档：[POC文档](examples/README.MD)

## Role说明

### supervisor

该角色用于安装和管理supervisor，自定义变量如下：

| 参数名                         | 默认值                              | 描述                  |
|-----------------------------|----------------------------------|---------------------|
| supervisor_run_user         | keta                             | supervisor执行的用户     |
| supervisor_bin_path         | ~/.local/bin                     | supervisor可执行程序的路径  |
| supervisor_conf_path        | /opt/ksupervisor/supervisor.conf | supervisor的配置文件路径   |
| supervisor_sockfile         | /opt/ksupervisor/supervisor.sock | supervisor的sock文件路径 |
| supervisor_pidfile          | /opt/ksupervisor/supervisor.pid  | supervisor的pid文件路径  |
| supervisor_logfile          | /opt/ksupervisor/supervisor.log  | supervisor的log文件路径  |
| supervisor_logfile_maxbytes | 50MB                             | supervisor的log最大字节数 |
| supervisor_logfile_backups  | 3                                | supervisor的log备份数量  |
| supervisor_loglevel         | info                             | supervisor的log记录级别  |

### mysql

该角色用于安装和管理mysql，自定义变量如下：

| 参数名                               | 默认值                              | 描述                     |
|-----------------------------------|----------------------------------|------------------------|
| mysql_install_file                | /tmp/mysql-8.0.33.tar.xz         | mysql的安装文件路径           |
| mysql_run_user                    | keta                             | mysql的用户               |
| mysql_run_pass                    | 123456                           | mysql的密码               |
| mysql_run_port                    | 3306                             | mysql的端口               |
| mysql_root_path                   | /opt/mysql                       | mysql的安装路径             |
| mysql_data_path                   | /opt/mysql/data                  | mysql的data目录           |
| mysql_logs_path                   | /opt/mysql/logs                  | mysql的logs目录           |
| mysql_timezone                    | +08:00                           | mysql的时区选择             |
| mysql_character                   | utf8mb4                          | mysql的编码               |
| mysql_collation                   | utf8mb4_unicode_ci               | mysql的编码               |
| mysql_supervisor_program          | keta-mysql                       | mysql的supervisor程序名    |
| mysql_supervisor_logfile          | /tmp/supervisor-keta-mysql.log   | mysql的supervisor日志路径   |
| mysql_supervisor_logfile_maxbytes | 50MB                             | mysql的supervisor日志最大字节 |
| mysql_supervisor_logfile_backups  | 3                                | mysql的supervisor日志备份数量 |
| supervisor_bin_path               | ~/.local/bin                     | supervisor的bin路径       |
| supervisor_conf_path              | /opt/ksupervisor/supervisor.conf | supervisor的配置          |

### ketadb

该角色用于安装和管理ketadb，自定义变量如下：

| 参数名                                | 默认值                        | 描述                      |
|------------------------------------|----------------------------|-------------------------|
| ketadb_version                     | latest                     | ketadb的版本号，如：v1.2.2.1   |
| ketadb_install_file                | /tmp/ketadb.tar.gz         | ketadb的安装包路径            |
| ketadb_run_user                    | keta                       | ketadb的用户               |
| ketadb_root_path                   | /opt/ketadb                | ketadb的安装路径             |
| ketadb_supervisor_program          | ketadb                     | ketadb的supervisor程序名    |
| ketadb_supervisor_logfile          | /tmp/supervisor-ketadb.log | ketadb的supervisor日志路径   |
| ketadb_supervisor_logfile_maxbytes | 50MB                       | ketadb的supervisor日志最大字节 |
| ketadb_supervisor_logfile_backups  | 3                          | ketadb的supervisor日志备份数量 |
| ketadb_heap_size                   | 2g                         | ketadb的运行时jvm堆内存大小      |
| ketadb_config                      | ---                        | ketadb的`keta.yml`配置内容   |

+ ketadb_config，常用参数如下：

| 参数名                              | 默认值              | 描述                        |
|----------------------------------|------------------|---------------------------|
| cluster.name                     | "default"        | 集群名称                      |
| network.host                     | "0.0.0.0"        | 程序监听IP                    |
| http.port                        | 9200             | http端口                    |
| transport.tcp.port               | 9300             | transport端口               |
| node.master                      | "true"           | 是否为master节点               |
| node.web                         | "true"           | 是否为web节点                  |
| node.data                        | "true"           | 是否为data节点                 |
| discovery.zen.ping.unicast.hosts | []               | 集群自动发现节点配置                |
| keta.environment                 | "local"          | 部署环境                      |
| keta.database.mysql.url          | "127.0.0.1:3306" | mysql地址                   |
| keta.database.mysql.database     | "ketadb"         | mysql数据库名                 |
| keta.database.mysql.user         | "keta"           | mysql用户                   |
| keta.database.mysql.password     | "123456"         | mysql密码                   |
| path.data                        | "../var/data"    | 仓库数据存储目录                  |
| path.logs                        | "../var/logs"    | 平台日志存储目录                  |
