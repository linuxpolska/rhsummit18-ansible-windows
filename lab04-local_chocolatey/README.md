# And now something completely different: Ansible on Windows
## Red Hat Summit 2018 Workshop
### Lab 04 - Create local Chocolatey repository

#### Summary:
Duration: ~ 20 minutes

In most corporate environments we need to maintain internal repositories with software that we use for deployments. You will deploy local Chocolatey repository on `workshop-w2` Windows VM and install `Firefox` on `workshop-w1`.

#### Steps:

##### Create local Chocolatey repository with Ansible

Change to `lab04-local_chocolatey` directory.

Run `./setup.sh` to deploy `chocolatey_server` Ansible role on `workshop-w2` Windows VM.

Next inspect the `site.yml`. The playbook does the following.

###### Runs the `chocolatey_server` Ansible role

The `chocolatey_server` Ansible role is located in `roles` directory.
It performs the following tasks:
* Ensures that IIS Web-Server and ASP.NET are installed.
* Installs the Chocolatey.server.
* Grants the required permissions to directories.
* Sets the Chocolatey web site in IIS and required authentication key.

###### Populates the server with selected software packages

Next the playbook downloads and pushes `Firefox` with its dependencies to just created Chocolatey repository.

###### Installs the software from local repository

`Firefox` is installed on `worshop-w1` Windows VM.
