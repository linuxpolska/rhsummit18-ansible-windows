# And now something completely different: Ansible on Windows
## Red Hat Summit 2018 Workshop
Instructors:
* Tomasz Dziedzic (tomasz.dziedzic@linuxpolska.pl)
* Konrad Rzentarzewski (konrad.rzentarzewski@linuxpolska.pl)
* Will Tome (wtome@redhat.com)

### Video

This talk has been recorded during Open Source Day conference in Warsaw (in Polish): https://www.youtube.com/watch?v=wSY87MhKVoc

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
* (Optional - if you already have another account) `Use another account`.
* Choose to create a new Azure account - `Create one!`.
* Apply for a new email address in @outlook.com domain by choosing - `Get a new email address`.
* Enter the username of your choice (should be relatively short).
* Set the password and confirm with 'Next'.
* Solve the captcha and confirm that you would like to stay signed in.
* STOP! Do not continue with account setup.

##### Redeem Azure Pass promo code _(takes ~ 5 minutes)_
* Enter https://www.microsoftazurepass.com/ and `Start` evaluation.
* Double check that your are using just created Azure account - `Confirm Microsoft Account`.
* Enter Azure Pass promo code provided by Instructor and hit `Claim promo Code` and then `Activate`.
* Fill in the forms, accept the policy (first checkbox) and confirm with `Sign up`.
* Wait for confirmation.
* Verify that the trial subscription was successfully added to your Azure account by checking `Subscriptions` in Azure Portal (`Or get started with your Azure subscription`).

#### Deploy Red Hat Enterprise Linux (RHEL) host with Ansible _(takes ~ 1 minute)_
Next step is to prepare our basic Ansible environment. You will deploy RHEL based VM with all necessary dependencies.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Flinuxpolska%2Frhsummit18-ansible-windows%2Fmaster%2Fazuredeploy.json"><img src="https://aka.ms/deploytoazurebutton"/></a>

Just click `Deploy to Azure` button and provide additional information through Azure Portal form:
* Subscription: `Azure Pass`
* Resource group: Create new : `ansiblerg`
* Location: `East US`
* Admin Password: choose your **password**.

Check `Agree to the terms and conditions stated above` and confirm with `Purchase`.

_Note: these resources will be covered with Free Azure Pass credits._

#### Create MS Azure app credentials and set required privileges
The following workshop exercises require us to provision Azure resources with Ansible modules.
To enable Azure resource provisioning with Ansible we need to enable application access via Azure API.
You will find detailed instructions below with a generic <a href="https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal">instructions</a> for reference purposes.

##### Register the ansible application with Azure Active Directory _(takes ~ 3 minutes)_

* In Azure Portal enter `Azure Active Directory` / `App registrations` / `New App Registration` and fill in the form with:
  - name: `ansible`,
  - type: `Web app / API`,
  - url: `http://ansible.net` _(or any URL)_.
* Hit `Create`.
* Write down **application id** (for future reference it will be **azure_client_id**).
* Enter `Settings` / `Keys` and fill in the first row with:
  - description: `ansible`,
  - expires: `Never expires`.
* Hit `Save` and write down key **Value** (for future reference it will be **azure_secret**)
* Enter `Azure Active Directory` / `Properties` and write down **Directory ID** (for future reference it will be **azure_tenant**)

##### Authorize the ansible application to manage resources _(takes ~ 1 minute)_
* Enter `Subscriptions` / `Azure Pass` and write down **Subscription ID** (for future reference it will be **azure_subscription_id**).
* Enter `Access Control (IAM)` / `Add` and fill in the form with:
  - Role: `owner`,
  - Assign access to: `Azure AD user, group, or application`,
  - Select: `ansible`,
* Click `ansible` and hit `Save`.

Your `ansible` application credentials will enable you to provision Azure resources with Ansible.

##### Verify written down "ansible" application credentials _(takes ~ 1 minute)_
Azure property name | Ansible module parameter | written down value
--- | --- | ---
application id | azure_client_id |
Key Value | azure_secret |
Subscription ID | azure_subscription_id |
Directory ID | azure_tenant |


#### Verify that all resources are set correctly (takes ~ 2 minute)
The Azure deployment template should prepare a single RHEL virtual machine `rhel7ansible` and install the necessary tools.

You can check the VM in Azure Portal entering `Virtual Machines` and selecting `rhel7ansible`.
Ssh access is available via public IP as _**ansible**_ user with password of your choice.
Azure template installs Python, Ansible with Windows modules and dependencies. It also clones this github repository.

### Workshop Labs

#### Lab 01 [Azure Resources Provisioning with Ansible](lab01-azure_provisioning)

Ansible enables you to provision IaaS resources. This gives You an ability to automate Windows Server provisioning. Let's prepare a set of Windows VMs on Azure. We will use them for the rest of the workshop.

#### Lab 02 [Installing software on Windows with Ansible and Chocolatey](lab02-installing_software)

You will install some software on your Windows VMs. We'll use `Chocolatey` package manager and download the software from public repository. Thanks to `win_chocolatey` Ansible module the operation is simple and the module handles all necessary prerequisites and dependencies for us.

#### Lab 03 [Troubleshooting Ansible Windows modules](lab03-troubleshoot)

Let's go through some Windows specific module challenges that you may encounter during your adventure with Ansible in the Windows realm.

#### Lab 04 [Create local Chocolatey repository](lab04-local_chocolatey)

In most corporate environments we need to maintain internal repositories with software that we use for deployments. You will deploy local Chocolatey repository on `workshop-w2` Windows VM and install `Firefox` on `workshop-w1`.

#### Lab 05 [Explore idempotence](lab05-idempotence)

`Idempotence` is a term that describes a quality that enables us to run Ansible playbook consecutively and get the same predictable result every time.

There is usually more than one way to achieve desired results. Let's explore different approaches to deploying an IIS site and their consequences for idempotence.

### After the Workshop
#### Stoping and starting Azure resources

You may wish to stop your Azure VMs to decrease the pace at which your credits are being depleted. Please inspect Azure Portal's `Virtual Machines` and check your options for stopping and starting the VMs.

#### Clean up
##### Remove deployed Azure resources

Go to ```lab01-azure_provisioning``` and run ```./teardown.sh``` script.

In Azure Portal choose `Resource Groups` and remove the `ansiblerg` resource group.

##### Close Azure account

Please use the instructions from [Cancel your subscription for Azure](https://docs.microsoft.com/en-us/azure/billing/billing-how-to-cancel-azure-subscription)
 to close your Azure account.

##### Close outlook.com account

Please use the instructions from [How to close your Microsoft account](https://support.microsoft.com/en-us/help/12412/microsoft-account-how-to-close-account) to close your Outlook.com account.
