# Automated set up of device

## Repo

Only proper projects which require VCS.

## Private

Files which should not be public will be transferred through external storage device or NAS/SMB/FTP.


## Learnings

The env in ansible is of the user with which you run ansible.
If you use become in some task. If you lookup the env in that task the environment variables will not be of root if you didn't run ansible as root.

Nice content <https://missing.csail.mit.edu/2020/security/>

## References

[1]: https://www.redhat.com/sysadmin/ansible-playbooks-secrets
[2]: https://docs.ansible.com/ansible/latest/collections/community/general/onepassword_lookup.html#ansible-collections-community-general-onepassword-lookup-parameter-subdomain
[3]: https://stackoverflow.com/questions/35654286/how-to-check-if-a-file-exists-in-ansible
[4]: https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_prompts.html
[5]: https://security.stackexchange.com/questions/267711/how-can-i-convert-an-ed25519-key-in-pkcs8-to-openssh-private-key-format (convert ssh key format)
[6]: https://github.com/microsoft/WSL/issues/8204#issuecomment-1338334154 (fix wsl time issue)
