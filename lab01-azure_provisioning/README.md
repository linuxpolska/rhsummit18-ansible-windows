# And now something completely different: Ansible on Windows
## Red Hat Summit 2018 Workshop
### Lab 01 - Azure Resources Provisioning with Ansible
#### Summary:
Duration: ~ 20 minutes.

* Log into `rhel7ansible` VM on Azure with `ssh`.
* Change directory to `~/rhsummit18-ansible-windows`.
* Edit the `azure.yml` file and fill in the credential details required for Azure API access.
* Run `deploy.sh` script on your `rhel7ansible` VM.

The script will provision a set of Azure resources along with a couple of Windows 2016 VM. The details of the machine will be saved to `inventory.txt` file in your local git repository folder.

Test whether communication with instances is successful: ```ansible -i ../instances.txt -m win_ping student```
