# copy config from example
init:
	cp main.yml.example main.yml

# install dependencies
install:
	ansible-galaxy install geerlingguy.swap geerlingguy.repo-epel geerlingguy.security geerlingguy.pip geerlingguy.docker

# run ansible playbook
start:
	ansible-playbook docker-ipsec-vpn.yml
s: start

# run ansible playbook without host key checking
nstart:
	ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook docker-ipsec-vpn.yml
ns: nstart
