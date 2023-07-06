DOCKER_INIT_CMD := "sed -i 's/archive.ubuntu.com/mirrors.cloud.tencent.com/g' /etc/apt/sources.list && sed -i 's/security.ubuntu.com/mirrors.cloud.tencent.com/g' /etc/apt/sources.list && export DEBIAN_FRONTEND=noninteractive && apt update && apt install sudo systemctl vim python2 libaio1 libnuma1 libtinfo5 ssh -y && cp /usr/bin/python2 /usr/bin/python && ssh-keygen -A && service ssh start && systemctl enable ssh && mkdir -p /home/keta/.ssh && useradd keta -d /home/keta && echo keta:123456 | chpasswd && chown -R keta:keta /home/keta && echo 'keta    ALL=(ALL:ALL) ALL' >> /etc/sudoers"

ansible-install:
	mkdir -p .ansible
	rm -rf .ansible/*
	tar -zxvf files/ansible/ansible.tgz -C .ansible --strip-components=1
	tar -zxvf files/ansible/sshpass.tgz -C ~/.local --strip-components=1
	@echo "#!/bin/bash" > ansible.sh
	@echo "${PWD}/.ansible/bin/python ${PWD}/.ansible/bin/ansible \$$@" >> ansible.sh
	@echo "#!/bin/bash" > ansible-playbook.sh
	@echo "${PWD}/.ansible/bin/python ${PWD}/.ansible/bin/ansible-playbook \$$@" >> ansible-playbook.sh
	chmod a+x ansible.sh ansible-playbook.sh

docker-create:
	docker-compose -f files/docker/docker-compose-ubuntu.yml up -d
	docker exec -it host_11 bash -c ${DOCKER_INIT_CMD}
	docker exec -it host_12 bash -c ${DOCKER_INIT_CMD}
	docker exec -it host_13 bash -c ${DOCKER_INIT_CMD}

docker-clean:
	docker-compose -f files/docker/docker-compose-ubuntu.yml stop
	docker-compose -f files/docker/docker-compose-ubuntu.yml rm -f
	docker network rm docker_keta_net
