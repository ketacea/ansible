## Role说明
### ketadb

该角色用于安装和管理ketadb，自定义变量如下：

| 参数名                 | 默认值                         | 描述                    |
|---------------------|-----------------------------|-----------------------|
| ketadb_version      | 1.2.3                       | ketadb的版本号，如：v1.2.3   |
| ketadb_install_file | /tmp/ketadb.tar.gz          | ketadb的安装包路径          |
| ketadb_run_user     | keta                        | ketadb的用户             |
| ketadb_run_service  | ketadb                      | ketadb的服务名称           |
| ketadb_root_path    | /opt/ketaops/lib/ketadb     | ketadb的安装路径           |
| ketadb_conf_path    | /opt/ketaops/etc/ketadb     | ketadb的配置文件路径         |
| ketadb_data_path    | /opt/ketaops/var/ketadb     | ketadb的data目录         |
| ketadb_logs_path    | /opt/ketaops/log/ketadb     | ketadb的logs目录         |
| ketadb_pkgs_path    | /opt/ketaops/package/ketadb | ketadb的二进制安装包目录       |
| ketadb_heap_size    | 2g                          | ketadb的运行时jvm堆内存大小    |
| ketadb_config       | ---                         | ketadb的`keta.yml`配置内容 |

+ ketadb_config，常用参数如下：

| 参数名                              | 默认值               | 描述          |
|----------------------------------|-------------------|-------------|
| cluster.name                     | "default"         | 集群名称        |
| network.host                     | "0.0.0.0"         | 程序监听IP      |
| http.port                        | 19200             | http端口      |
| transport.tcp.port               | 19300             | transport端口 |
| node.master                      | "true"            | 是否为master节点 |
| node.web                         | "true"            | 是否为web节点    |
| node.data                        | "true"            | 是否为data节点   |
| discovery.zen.ping.unicast.hosts | []                | 集群自动发现节点配置  |
| keta.environment                 | "local"           | 部署环境        |
| keta.database.mysql.url          | "127.0.0.1:13306" | mysql地址     |
| keta.database.mysql.database     | "ketadb"          | mysql数据库名   |
| keta.database.mysql.user         | "keta"            | mysql用户     |
| keta.database.mysql.password     | "654321"          | mysql密码     |
