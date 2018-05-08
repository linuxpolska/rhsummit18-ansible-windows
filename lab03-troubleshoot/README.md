# And now something completely different: Ansible on Windows
## Red Hat Summit 2018 Workshop
### Lab 03 - Troubleshooting Ansible Windows modules

#### Summary:
Duration: ~ 10 minutes

Let's go through some Windows specific module challenges that you may encounter during your adventure with Ansible in the Windows realm.

#### Steps:

##### Deploy Windows banner with Ansible `win_regedit` module

Run `setup1.sh` script to deploy welcome banner to your Windows VMs. The `win_regedit` module will be usefull here.

When the playbook finishes with success log into `workshop-w1` Windows VM with RDP. and check if the banner is displayed correctly.

_Why the banner is not present despite the playbook reported success?_

##### Let's troubleshoot the problem adding more verbosity

Run `setup2.sh` script that issues the same command but with higher level of message verbosity _(-vvvvv option)_.

You can see Ansible reporting `win_regedit` module being used to change the Windows registry values, but we have no idea how this particular module works and why our task fails with success.

To go further we need to inspect the module Powershell code that it runs on target Windows VM.

##### Keep Ansible temporary files on Windows VM for inspection

Run `setup3.sh` script that sets `ANSIBLE_KEEP_REMOTE_FILES` to value `1` so that Ansible keeps the temporary files with Powershell commands that were used during playbook run.

##### Find the Ansible temporary files

Run `setup4.sh` script that displays Ansible temporary files locations.

##### Inspect the temporary files contents
