FROM centos:centos6
MAINTAINER ptro <ptro@centrum.cz>

# Setup Ansible to run localy
RUN yum -y install epel-release && yum install -y sudo ansible python openssh openssh-server openssh-clients && yum -y update
RUN useradd ansible && usermod -a -G root ansible && chmod g+w /var/log
RUN su - ansible -c "ssh-keygen -b 3072 -N '' -f /home/ansible/.ssh/id_rsa && cp /home/ansible/.ssh/id_rsa.pub /home/ansible/.ssh/authorized_keys && chmod 600 /home/ansible/.ssh/authorized_keys"
ADD sudo/ansible /etc/sudoers.d/ansible
ADD sudo/developer /etc/sudoers.d/developer
ADD ansible/ansible.conf /etc/ansible/ansible.cfg
ADD ansible/hosts /etc/ansible/hosts

# Run ansible modules from git repository
RUN yum -y install git && su - ansible -c "git clone https://github.com/ptro-development/ansible_python_vim_developer.git /home/ansible/ansible_python_vim_developer"
RUN service sshd restart && su - ansible -c "ssh-keyscan localhost > /home/ansible/.ssh/known_hosts && ansible-playbook /home/ansible/ansible_python_vim_developer/roles/python_vim_developer_nodes.yml"

# To start services when initialising docker container
ADD run_at_startup /usr/bin/run_at_startup
RUN echo "/usr/bin/run_at_startup" >> ~/.bashrc && chmod +x /usr/bin/run_at_startup
