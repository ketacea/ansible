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

