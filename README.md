Docker IPsec VPN on CentOS 8

- 2Gb swap
- fail2ban
- ssh on custom port
- firewall
- disable selinux
- python3
- install docker & docker-compose
- create user www, add auth keys, group docker
- prepare docker ipsec vpn


# Prerequisites

1. Generate ssh-key if necessary

Example:

```
ssh-keygen -t ed25519 -C "your_email@example.com"
```

2. Install ansible

Example:

```
brew install ansible
```

3. Configure Ansible

```
vim ~/.ansible.cfg 
```

```
[defaults]
inventory      = ~/.ansible_hosts
```

# Ansible playbook

1. Add server credentials to ~/.ansible_hosts

Example:

```
[vpn]
vpn1 ansible_user=root ansible_host=127.0.0.1
```

2. Init config and edit if necessary

```
make init
```

edit main.yml

3. Install additional Ansible roles from Ansible Galaxy

```
make install
```

4. Copy your ~/.ssh/id_rsa.pub to files/authorized_keys

`cat ~/.ssh/id_rsa.pub > ./files/authorized_keys`

5. Run playbook

```
make s
```

or without strict host checking

```
make ns
```

6. Add server credentials to ~/.ssh/config

Example:

```
#vpn

Host vpn1
User www
Port 2222
Hostname 127.0.0.1
```


# VPN Server starting

1. Connect to server via ssh `ssh vpn` and go to docker-ipsec-vpn dir `cd docker-ipsec-vpn`

2. Init env-file `./init.sh`

3. Start VPN Server `./start.sh`

4. Copy config from container `./copy_config.sh` (for Mac and iOS)

Please look at README on [hwdsl2/docker-ipsec-vpn-server](https://github.com/hwdsl2/docker-ipsec-vpn-server#configure-and-use-ikev2-vpn) repository for another config options. 


# Copy config from server (for Mac and iOS)

1. `scp vpn:./docker-ipsec-vpn/vpnclient.mobileconfig .`
