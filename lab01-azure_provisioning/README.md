# And now something completely different: Ansible on Windows
## Red Hat Summit 2018 Workshop
### Lab 01 - Azure Resources Provisioning with Ansible
#### Summary:
Duration: ~ 20 minutes.

#### Steps:
##### Configure Azure access credentials for Ansible
* Log into `rhel7ansible` VM on Azure with `ssh`.
* Change directory to `~/rhsummit18-ansible-windows`.
* Edit the `azure.yml` file and fill in the credential details required for Azure API access.
```
azure_client_id: ''
azure_secret: ''
azure_subscription_id: ''
azure_tenant: ''
azure_location: 'eastus'
```
* Create an encrypted password for `ansible` user that will be created on Windows VM. Just edit `./secrets.yml` and input the password of your choice. **NOTE: We will be looking at this password in plaintext later on so do not use a sensitive value.**
* Next encrypt the contents issuing `ansible-vault encrypt ./secrets.yml` command and providing you encryption password.
* Change directory to `~/rhsummit18-ansible-windows/lab01-azure_provisioning`
* Run `deploy.sh` script on your `rhel7ansible` VM.
The script will provision a set of Azure resources along with a couple of Windows 2016 VM. The details of the machine will be saved to `../inventory.txt` file in your local git repository folder.

##### Wait for the script to complete
The script takes ~ 10 minutes to provision required resources. Let's see the Ansible playbooks that are called by the script.

##### Verify that Windows VM was deployed successfully
`../inventory.txt` file created in your local git repo contains IP address of your Windows VMs. You can verify it through Azure Portal: `Virtual Machines` and looking for public IP address of selected VMs.

Test whether communication with instances is successful: ```ansible -i ../instances.txt -m win_ping windows```

##### Connect to Windows VM with RDP client

You can quickly connect to the VM by clicking `Connect` icon for RDP connection shortcut. The username `ansible` is set in `vars/main.yml` file under `windows_user` and password was set in `../secrets.yml` file.
