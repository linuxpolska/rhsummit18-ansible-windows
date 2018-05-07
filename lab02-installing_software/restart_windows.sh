ansible-playbook -i ../instances.txt -e ansible_python_interpreter=$(which python) windows-updates.yml
