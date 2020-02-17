ansible brserver -b -m yum -a "name=httpd state=absent"
ansible-playbook web.yml -e "target_service=httpd"
