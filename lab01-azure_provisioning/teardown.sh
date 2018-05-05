ansible-playbook -i inventory -e @../azure.yml -e ansible_python_interpreter=$(which python) teardown.yml
