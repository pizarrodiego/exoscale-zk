#!/bin/bash

# Build custom image
docker build -t zk_ansible .

# Directories that will be mounted
currdir=`pwd`
sshdir=${currdir}/.ssh
ansibledir=${currdir}/ansible

# Make sure the sshdir exists
mkdir -p ${sshdir}

# Create bash history file if it does not exist
touch .bash_history


action=${1:-default}

# Run bash in container
if [[ "$action" == 'default'  ]]; then
	command="bash"
else
	command="ansible-playbook /etc/ansible/${action}-playbook.yml"
fi

docker run --rm -it -v ${currdir}/.bash_history:/root/.bash_history -v ${sshdir}:/root/.ssh -v ${ansibledir}:/etc/ansible zk_ansible ${command}
