# And now something completely different: Ansible on Windows
## Red Hat Summit 2018 Workshop
### Lab 02 - Installing software on Windows with Ansible and Chocolatey

#### Summary:
Duration: ~ 20 minutes

You will install some software on your Windows VMs. We'll use `Chocolatey` package manager and download the software from public repository. Thanks to `win_chocolatey` Ansible module the operation is simple and the module handles all necessary prerequisites and dependencies for us.

#### Steps:

##### Install selected software on you Windows VMs
Change directory to `lab02-installing_software` and run `install_software.sh`.
Let's look into the code `install_software.yml` playbook deploys the software.

The playbook installs `putty` and `winscp` on both Windows VMs. It also installs `Visual Studio` and `git` on `workstation-w1` and `Firefox` and `Atom` on `workstation-w2`. At the end it just reboots the VMs and waits for the reboot to finish.
