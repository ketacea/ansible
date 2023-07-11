DOCKER_INIT_CMD := "sed -i 's/archive.ubuntu.com/mirrors.cloud.tencent.com/g' /etc/apt/sources.list && sed -i 's/security.ubuntu.com/mirrors.cloud.tencent.com/g' /etc/apt/sources.list && export DEBIAN_FRONTEND=noninteractive && apt update && apt install sudo systemctl vim python2 libaio1 libnuma1 libtinfo5 libncurses5 ssh -y && cp /usr/bin/python2 /usr/bin/python && ssh-keygen -A && service ssh start && systemctl enable ssh && mkdir -p /home/keta/.ssh && useradd keta -d /home/keta && echo keta:123456 | chpasswd && chown -R keta:keta /home/keta && echo 'keta    ALL=(ALL:ALL) ALL' >> /etc/sudoers"

ansible-install:
	@mkdir -p .ansible
	@rm -rf .ansible/*
	@tar -zxf tools/ansible/ansible.tgz -C .ansible --strip-components=1
	@tar -zxf tools/ansible/sshpass.tgz -C ~/.local --strip-components=1
	@echo "#!/bin/bash" > ansible.sh
	@echo "${PWD}/.ansible/bin/python ${PWD}/.ansible/bin/ansible \$$@" >> ansible.sh
	@echo "#!/bin/bash" > ansible-playbook.sh
	@echo "${PWD}/.ansible/bin/python ${PWD}/.ansible/bin/ansible-playbook \$$@" >> ansible-playbook.sh
	@chmod a+x ansible.sh ansible-playbook.sh
	@echo "\ninstall successfully. \n\nyou can use ./ansible.sh or ./ansible-playbook.sh to run ansible.\n"

ansible-mac-install:
	@pip2 install -U ansible
	@echo "#!/bin/bash" > ansible.sh
	@echo "/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/ansible \$$@" >> ansible.sh
	@echo "#!/bin/bash" > ansible-playbook.sh
	@echo "/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/ansible-playbook \$$@" >> ansible-playbook.sh
	@chmod a+x ansible.sh ansible-playbook.sh
	@echo "\ninstall successfully. \n\nyou can use ./ansible.sh or ./ansible-playbook.sh to run ansible.\n"

docker-create:
	@echo "\ncreate docker network keta-net for keta host\n"
	@if [ -z "$$(docker network ls | grep keta-net)" ]; then docker network create --subnet=172.10.0.0/24 keta-net; fi
	@echo "\ncreate docker container for keta host\n"
	@if [ -z "$$(docker ps -a | grep keta_host_10)" ]; then docker run -dit --restart=unless-stopped --name=keta_host_10 --privileged=true --net=keta-net --ip 172.10.0.10 -p 9200-9800:9200-9800 ubuntu:20.04 bash; fi
	@echo "\nInit docker container for ansible\n"
	@if [ -z "$$(docker exec -it keta_host_10 python2 --version | grep 2.7)" ]; then docker exec -it keta_host_10 bash -c ${DOCKER_INIT_CMD}; fi
	@ssh-keygen -f ~/.ssh/known_hosts -R "172.10.0.10"
	@echo "\ncreate successfully. you can ssh keta@172.10.0.10 with password: 123456.\n"

docker-clean:
	@echo "\nremove docker container keta_host_10 from keta host\n"
	@if [ ! -z "$$(docker ps -a | grep keta_host_10)" ]; then docker rm -f keta_host_10; fi
	@echo "\nremove docker network keta-net from keta host\n"
	@if [ ! -z "$$(docker network ls | grep keta-net)" ]; then docker network rm keta-net; fi
	@echo "\nremove successfully.\n"
