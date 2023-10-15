# Automated set up of device

> Automation of my device setup

It installs:
1. All the required libraries.
2. All the tools
3. All my github repos

To set up new system:

```bash
mkdir personal && cd personal
git clone https://github.com/rajguru7/sys-set-up.git
cd sys-set-up

#for complete install
#./ansible-run complete

#for custom install
#./ansible-run
#and then choose required tags

#once done connect ssd and download private directories(finance,work) from ssd
#wsl-backupdisk.bash download
```

**This is tested on Ubuntu 22.04**

Requirements for complete install:
1. Needs 1password account for downloading private github ssh keys
2. Make sure you have added your ssh keys to 1password
3. Edit tasks/ssh-setup.yaml with your 1password vault, domain and ssh key name.

If ssh set up is not required or if you don't have 1password:
1. do a custom install
2. remove set-ssh tag for custom install
3. add your ssh keys manually or make sure you use http git url to pull your personal projects and dotfiles repos.


---

## Public 

Only proper projects which require VCS.

## Private

Files which should not be public will be transferred through external storage device or NAS/SMB/FTP.

---

**tldr**
The tldr client installed using apt is not the official one. Also it has update issues.[[7]](ext7)
It manually installs gh repo in ~/.local/share to update. Current apt tldr client is referencing master branch which has been moved to main.
Will use pip to install as it is official.

## Acknowledgements

Thanks to @ThePrimeagen for his youtube videos and the course on [frontend masters](https://frontendmasters.com/courses/developer-productivity/). Check out his set up at <https://github.com/ThePrimeagen/ansible>

## Learnings

The env in ansible is of the user with which you run ansible.
If you use become in some task. If you lookup the env in that task the environment variables will not be of root if you didn't run ansible as root.

Nice content <https://missing.csail.mit.edu/2020/security/>

you need to source zshrc when running a script if you want aliases, variables to be inherited. Ansible provides the environment with which it was executed. Refer python-setup

## References

[1] <https://www.redhat.com/sysadmin/ansible-playbooks-secrets>  
[2] <https://docs.ansible.com/ansible/latest/collections/community/general/onepassword_lookup.html#ansible-collections-community-general-onepassword-lookup-parameter-subdomain>  
[3] <https://stackoverflow.com/questions/35654286/how-to-check-if-a-file-exists-in-ansible>  
[4] <https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_prompts.html>  
[5] <https://security.stackexchange.com/questions/267711/how-can-i-convert-an-ed25519-key-in-pkcs8-to-openssh-private-key-format> (convert ssh key format)  
[6] <https://github.com/microsoft/WSL/issues/8204#issuecomment-1338334154> (fix wsl time issue)  
[7] <https://groups.google.com/g/linux.debian.bugs.dist/c/t1U4XLMUT7Y>  

[ext1]: https://www.redhat.com/sysadmin/ansible-playbooks-secrets
[ext2]: https://docs.ansible.com/ansible/latest/collections/community/general/onepassword_lookup.html#ansible-collections-community-general-onepassword-lookup-parameter-subdomain
[ext3]: https://stackoverflow.com/questions/35654286/how-to-check-if-a-file-exists-in-ansible
[ext4]: https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_prompts.html
[ext5]: https://security.stackexchange.com/questions/267711/how-can-i-convert-an-ed25519-key-in-pkcs8-to-openssh-private-key-format (convert ssh key format)
[ext6]: https://github.com/microsoft/WSL/issues/8204#issuecomment-1338334154 (fix wsl time issue)
[ext7]: https://groups.google.com/g/linux.debian.bugs.dist/c/t1U4XLMUT7Y
