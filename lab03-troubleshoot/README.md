# And now something completely different: Ansible on Windows
## Red Hat Summit 2018 Workshop
### Lab 03 - Troubleshooting Ansible Windows modules

#### Summary:
Duration: ~ 20 minutes

Let's go through some Windows specific module challenges that you may encounter during your adventure with Ansible in the Windows realm.

#### Steps:

##### Deploy Windows banner with Ansible `win_regedit` module

You will set a Windows registry key `legalnoticecaption` on both of the machines. For `workshop-w1` the welcome banner will state `Hello Summit!` and for `workshop-w2` it will welcome you with `Ansible and Windows rocks!`.

In order to achieve it `site.yml` calls `win_regedit` module with parameters:
* `path` for registry key location.
* `name` for key name.
* `val` for key value.

Run `setup1.sh` script to deploy welcome banner to your Windows VMs.

When the playbook finishes with success log into `workshop-w1` Windows VM with RDP and check if the banner is displayed correctly.

_Why the banner is not present despite the playbook reported success?_

##### Let's troubleshoot the problem by adding more verbosity

Run `setup2.sh` script that issues the same command but with higher level of message verbosity _(-vvvvv option)_.

You can see Ansible reporting `win_regedit` module being used to change the Windows registry values, but we have no idea how this particular module works and why our task fails with success.

Find line that states:
`Using module file /[...]/win_regedit.ps1` and inspect the file contents. In our case the file was located in `/usr/local/python-virtualenvs/project-virtualenv/lib/python2.7/site-packages/ansible/modules/windows/win_regedit.ps1`.
You can inspect it with `less -N` command on your `rhel7ansible` VM.

** Please note: **
* there is no `$val` parameter in the script.
* `$data` parameter _(in line 18)_ lacks input validation and allows for empty value.

** Problem description: **

The `win_regedit` module ignores the fact that we have provided the `val` parameter which is ignored, and that we have not provided `data` parameter which is essential for what we wanted to achieve.
Another problem is that the module set the empty value and reported success despite not achieving the desired state.

##### Run the corrected playbook

Now we can correct the problem.

Run `setup3.sh` that calls `site-solved.yml` with the correct module parameters.

When you connect to Windows VM with RDP you should be greeted with welcome message.

##### Keep Ansible temporary files on Windows VM for inspection

Sometimes it is harder to get to the source of the problem just by inspecting the module code.
You can resort to inspecting the temporary files that Ansible runs on the managed machine during playbook run.
By default Ansible removes the temporary files after the playbook task finishes.

Run `setup4.sh` script that sets `ANSIBLE_KEEP_REMOTE_FILES` to value `1` so that Ansible keeps the temporary files with Powershell commands that were used during playbook run.

##### Find the Ansible temporary files

In order to find the actual location of files that Ansible left you can check VM specific location.

Run `setup5.sh` script that displays Ansible temporary files locations.

The location directory starts with `ansible-tmp-`.
