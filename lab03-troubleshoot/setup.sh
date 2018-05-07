ansible-playbook -i ../instances.txt site.yml
# ansible-playbook -i ../instances.txt site.yml -vvvvv
# ANSIBLE_KEEP_REMOTE_FILES=1 ansible-playbook -i ../instances.txt site.yml -vvvvv
# ansible -i ../instances.txt -m raw -a 'tree /f $env:temp' workshop-w1
