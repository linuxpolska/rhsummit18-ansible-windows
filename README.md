# And now something completely different: Ansible on Windows
## Red Hat Summit 2018 Workshop
Instructors: Tomasz Dziedzic (Linux Polska), Konrad Rzentarzewski (Linux Polska), Will Tome (Red Hat)
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

TODO: instruction for creating an account and registering a Pass
https://www.microsoftazurepass.com/Home/HowTo

##### Register new Azure account (takes ~ 2 minutes)
* Enter https://azure.microsoft.com/en-us/free/ and "Start Free" account.
* Nie masz konta? Utwórz je!
* Uzyskaj nowy adres e-mail
* Wprowadź nazwę nowego konta outlook.com
* Ustaw hasło
* do not continue with account setup !

##### Redeem Azure Pass promo code (takes ~ 5 minutes)
* https://www.microsoftazurepass.com/ -> hit Start button
* confirm that you are using the right azure account you have just created
* Enter Azure Pass promo code
* hit Activate
* accept first checkbox
* wait for confirmation
* verify that the trial subscription was successfully added to your Azure account
Zarządzanie kosztami i rozliczenia
-> Subskrypcje (relogging may speed up subscription view refresh)

#### Deploy Red Hat Enterprise Linux host with Ansible
TODO: instruction for configuring a template and deploying rhel instance

TODO: change deploy icon url

TODO: verify that all deployed resources are set properly: rg, github repo, ...

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Flinuxpolska%2Frhsummit18-ansible-windows%2Fmaster%2Fazuredeploy.json" target="_blank"><img src="http://azuredeploy.net/deploybutton.png"/></a>

#### Create MS Azure app credentials and set required privileges
TODO: instruction for creating clientid and role for subscription
https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal
* (not sure if necessary) Azure Active Directory -> User Settings - make sure that users can create apps
* (not sure if necessary) Azure Active Directory -> Overview - your role: Administrator globalny
* Azure Active Directory -> App registrations -> New App Registration - name: ansible, type: web/api, url: http://ansible.net
* make note of application id (click copy icon to the right)
* settings -> keys - description: ansible, expires: 1y -> save
* make note of key value, copy it
* Active Directory -> Properties - make note of Directory ID
* Subscriptions -> Azure ... -> ...(IAM) -> Add -> Role: owner, access: ad user, choose: ansible -> save

#### Verify that all resources are set correctly

### Clean up after the Workshop
#### Remove deployed Azure resources
#### Close Azure account
#### Close outlook.com account
