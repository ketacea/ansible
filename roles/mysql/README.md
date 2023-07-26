## Role说明
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