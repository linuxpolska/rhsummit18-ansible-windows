ansible-playbook --ask-vault-pass -i inventory -e @../secrets.yml -e @../azure.yml -e ansible_python_interpreter=$(which python) site.yml
