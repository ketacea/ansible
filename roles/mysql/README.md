## Role说明
### mysql

该角色用于安装和管理mysql，自定义变量如下：

| 参数名                | 默认值                        | 描述             |
|--------------------|----------------------------|----------------|
| mysql_install_file | /tmp/mysql-8.0.33.tar.xz   | mysql的安装文件路径   |
| mysql_version      | 8.0.33                     | mysql的版本       |
| mysql_username     | keta                       | mysql的用户       |
| mysql_password     | 654321                     | mysql的密码       |
| mysql_port         | 13306                      | mysql的端口       |
| mysql_root_path    | /opt/ketaops/lib/mysql     | mysql的安装路径     |
| mysql_conf_path    | /opt/ketaops/etc/mysql     | mysql的配置文件路径   |
| mysql_data_path    | /opt/ketaops/var/mysql     | mysql的data目录   |
| mysql_logs_path    | /opt/ketaops/log/mysql     | mysql的logs目录   |
| mysql_pkgs_path    | /opt/ketaops/package/mysql | mysql的二进制安装包目录 |
| mysql_timezone     | +08:00                     | mysql的时区选择     |
| mysql_character    | utf8mb4                    | mysql的编码       |
| mysql_collation    | utf8mb4_unicode_ci         | mysql的编码       |