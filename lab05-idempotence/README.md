# And now something completely different: Ansible on Windows
## Red Hat Summit 2018 Workshop
### Lab 05 - Explore idempotence

#### Summary:
Duration: ~ 20 minutes

`Idempotence` is a term that describes a quality that enables us to run Ansible playbook consecutively and get the same predictable result every time.

There is usually more than one way to achieve desired results. Let's explore different approaches to deploying an IIS site and their consequences for idempotence.

#### Steps:

##### Use Powershell command line to deploy IIS site

Change to `lab05-idempotency` directory

Run `deploy1.sh` to execute `cmdline.yml` playbook.

If you run it again you will notice issues with lack of idempotence. The second playbook run throws errors.

##### Use DSC (Windows PowerShell Desired State Configuration) module to deploy IIS site

Run `deploy2.sh` to execute `dsc.yml` playbook.

Please note that although this playbook tries to deploy IIS site that is already created. It doesn't throw errors but falsely reports that the site was created `"changed": true`.

If you run it second time it will also report that the site was successfully deployed but in fact the site was already there.

##### Use dedicated Ansible module to deploy IIS site

Now let's try dedicated Ansible modules.

Run `deploy3.sh` to execute `native.yml` playbook.

This time we have a desired indempotence. The playbook run reports that the task was successfully run, the site is deployed. But it hasn't changed anything (``"changed": false`) which was a desired behavior.

#### Further exploration

You may edit `vars.yml` to experiment deploying different IIS sites.
