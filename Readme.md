# introduction

Ansible provides a simple way to deploy, manage and configure the ketaops platform. Specifically this repository:

- Installs KetaOps Platform packages
- Provides configuration options

the services that can be installed from this repository are:

- mysql - meta database
- ketadb - the observability backend, frontend and database

You can find supported configuration variables in

- [common variables](common_variables.md)
- [mysql variables](roles/mysql/README.md)
- [ketadb variables](roles/ketadb/README.md)

# structure

| path                   | desc        |
|------------------------|-------------|
| `/opt/ketaops/lib`     | application |
| `/opt/ketaops/etc`     | config file |
| `/opt/ketaops/log`     | logs        |
| `/opt/ketaops/var`     | data dir    |
| `/opt/ketaops/package` | package dir |

# Installation

Deploy KetaOps Platform in 3 steps with the Ansible Installer

#### Requirement

1. The ability to reach ketaops's software package repository at phoenix-public-1312700048.cos.ap-shanghai.myqcloud.com
2. At least 2 vCPUs, 8GB of RAM, and 8GB of storage.
3. RHEL/CentOS 7.x, RHEL/CentOS 8.x, Debian 9, Ubuntu 16.04 LTS, or Ubuntu 18.04 LTS operating system.
4. Installed Software
    - Check that Python 3 is installed by running the following:
        - ```python --version```
    - Check that SSH is installed by running the following:
        - ```ssh -V```
    - Check that Ansible v2.11+ is installed by running the following:
        - ```ansible --version```
    - Check the dependency packages of MySQL server:
        - ```sudo apt install -y libaio1 libncurses5```

#### Machine

Get machine list:

- 192.168.1.1
- 192.168.1.2
- 192.168.1.3

install ketaops service

- A mysql instance on
    - 192.168.1.1
- Tree ketadb instance on
    - 192.168.1.1
    - 192.168.1.2
    - 192.168.1.3

#### Download && Install

- Run the following command to download the Keta Ansible Playbook:

```shell
ansible-galaxy collection install git+https://gitee.com/xishuhq/keta-ansible.git
```

```shell
git clone git@gitee.com:xishuhq/keta-ansible.git
ansible-galaxy collection install --force ./keta-ansible
```

- Download packages: `MySQL (8.0.33)` and `KetaDB (1.2.2.1)`

```shell
wget https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.33-linux-glibc2.17-x86_64-minimal.tar.xz -O /tmp/mysql-8.0.33.tar.xz
wget https://phoenix-public-1312700048.cos.ap-shanghai.myqcloud.com/ketadb-release/1.2.2.x/ketadb/keta-v1.2.2.1-apps.tar.gz -O /tmp/keta-v1.2.2.1-apps.tar.gz
```

- Copy the following into a file called ansible.cfg that can be saved in the current directory

```ini
[defaults]
hash_behaviour=merge
```

- Copy the following into a file called hosts.yml that can be saved in the current directory

```yaml
all:
  vars:
    ansible_ssh_user: keta
    ansible_ssh_pass: 123456
  children:
    mysql:
      hosts:
        mysql-master: { ansible_ssh_host: 192.168.1.1 }
    keta:
      hosts:
        keta-1: { ansible_ssh_host: 192.168.1.1 }
        keta-2: { ansible_ssh_host: 192.168.1.2 }
        keta-3: { ansible_ssh_host: 192.168.1.3 }
```

- Run the following command:

```ansible-playbook -i hosts.yml ketaops.platform.all -K -t install,config,enable,start```

# FQA

#### 1. What do all these commands do

| path        | desc                                                   |
|-------------|--------------------------------------------------------|
| `install`   | push package to target host                            |
| `config`    | push config to target host                             |
| `enable`    | load application into systemd using `systemctl reload` |
| `start`     | start application using `systemctl start`              |
| `restart`   | restart applicatioin using `systemctl restart`         |
| `stop`      | stop application using `systemctl stop`                |
| `uninstall` | remove application package, config ,data dir           |

#### 2. install mysql then install ketadb

```shell
ansible-playbook -i hosts.yml ketaops.platform.mysql -K -t  install,config,enable,start
ansible-playbook -i hosts.yml ketaops.platform.ketadb -K -t  install,config,enable,start
```

#### 3. one by one install mysql 

```shell 
ansible-playbook -i hosts.yml ketaops.platform.mysql -K -t  install
ansible-playbook -i hosts.yml ketaops.platform.mysql -K -t  config
ansible-playbook -i hosts.yml ketaops.platform.mysql -K -t  enable
ansible-playbook -i hosts.yml ketaops.platform.mysql -K -t  start
```
### 4. restart one ketadb instance `keta-1` or one ketadb group `keta`
```shell
ansible-playbook --limit keta-1 -i hosts.yml ketaops.platform.ketadb -K -t restart
ansible-playbook --limit keta -i hosts.yml ketaops.platform.ketadb -K -t restart
```
### 4. how to debug 
```shell
ansible all -m shell -a 'ls /opt/ketaops'
ansible ketadb -m shell -a 'ls /opt/ketaops' 
ansible keta-1 -m shel -a 'ls /opt/keatops'
```

### 5. how to check hosts.yml syntax
```shell
ansible-playbook -i hosts.yml --syntax-check ketaops.platform.all
```