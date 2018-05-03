# And now something completely different: Ansible on Windows
## Red Hat Summit 2018 Workshop
Instructors:
* Tomasz Dziedzic (tomasz.dziedzic@linuxpolska.pl)
* Konrad Rzentarzewski (konrad.rzentarzewski@linuxpolska.pl)
* Will Tome (wtome@redhat.com)

### Workshop summary:
The Workshop is a lightweight introduction to Ansible for Windows deployments automation and configuration tasks. Things were simplified for the purpose of 2 hour workshop format. We will utilize Microsoft Azure resources (courtesy of Microsoft).

### Prerequisites:
The Workshop is a hands-on experience and requires you to bring your own device.

You will need:
* Laptop (or other type of terminal with Internet access)
* Web browser
* ssh client
* RDP client

### Prepare for the Workshop:
#### Register Microsoft Azure Pass with new Azure account and setup access privileges
For the purpose of the workshop we will utilize Azure Passes that enable free consumption of selected resources up to 100$ credit limit. You will be able to continue your journey into Ansible on Windows after the Workshop. Azure Passes can be consumed once per account so the safest way is to create a new Azure account.
You will find detailed instruction below and a generic <a href="https://www.microsoftazurepass.com/Home/HowTo">how to</a> for reference.

##### Register new Azure account _(takes ~ 2 minutes)_
* Enter https://azure.microsoft.com/en-us/free/ and `Start Free` account.
* Opt for creating a new account.
* Apply for a new email address in @outlook.com domain.
* Enter the username of your choice (should be relatively short).
* Set the password and confirm.
* STOP! do not continue with account setup.

##### Redeem Azure Pass promo code _(takes ~ 5 minutes)_
* Enter https://www.microsoftazurepass.com/ and `Start` evaluation.
* Double check that your are using just created Azure account.
* Enter Azure Pass promo code provided by Instructor and hit `Activate`.
* Accept the policy (first checkbox).
* Wait for confirmation.
* Verify that the trial subscription was successfully added to your Azure account by checking `Subscriptions` in Azure Portal (refresh can be sped up by relogging).

#### Deploy Red Hat Enterprise Linux (RHEL) host with Ansible _(takes ~ 1 minute)_
Next step is to prepare our basic Ansible environment. You will deploy RHEL based VM with all necessary dependencies.
Just click `Deploy to Azure` button and provide some additional information through Azure Portal form. Make sure that location is `East US` and you remember the **password**.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Flinuxpolska%2Frhsummit18-ansible-windows%2Fmaster%2Fazuredeploy.json"><img src="http://azuredeploy.net/deploybutton.png"/></a>

#### Create MS Azure app credentials and set required privileges
The following workshop exercises require us to provision Azure resources with Ansible modules.
To enable Azure resource provisioning with Ansible we need to enable application access via Azure API.
You will find detailed instructions below with a generic <a href="https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal">instructions</a> for reference purposes.

##### Register the ansible application with Azure Active Directory _(takes ~ 3 minutes)_

* In Azure Portal enter `Azure Active Directory` / `App registrations` / `New App Registration` and fill in the form with:
  - name: "ansible",
  - type: "web/api",
  - url: "http://ansible.net".
* Write down **application id** (for future reference it will be **azure_client_id**).
* Enter `Settings` / `Keys` and fill in the first row with:
  - description: "ansible",
  - expires: "1y",
* Hit `Save` and write down key **Value** (for future reference it will be **azure_secret**)
* Enter `Active Directory` / `Properties` and write down **Directory ID** (for future reference it will be **azure_tenant**)

##### Authorize the ansible application to manage resources _(takes ~ 1 minute)_
* Enter `Subscriptions` / `Azure ...` and write down **Subscription ID** (for future reference it will be **azure_subscription_id**).
* Enter `...(IAM)` / `Add` and fill in the form with:
  - Role: owner,
  - access: ad user,
  - choose: ansible
* Hit `Save`.

Your "ansible" application credentials will enable you to provision Azure resources with Ansible.

##### Verify written down Ansible application credentials _(takes ~ 1 minute)_
Azure property name | Ansible module parameter | written down value
--- | --- | ---
application id | azure_client_id |
Key Value | azure_secret |
Subscription ID | azure_subscription_id |
Directory ID | azure_tenant |


#### Verify that all resources are set correctly (takes ~ 2 minute)
The Azure deployment template should prepare a single RHEL virtual machine (rhel7ansible) and install the necessary tools.

You can check the VM in Azure Portal entering `Virtual Machines` and selecting `rhel7ansible`.
Ssh access is available via public IP as _**ansible**_ user with password of your choice.
Azure template installs Python, Ansible with Windows modules and dependencies. It also clones this github repository.

### Clean up after the Workshop
#### Remove deployed Azure resources
#### Close Azure account
#### Close outlook.com account
