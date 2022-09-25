# Dictionary App Deployer

To run a playbook you need to create `vault_pass.txt` file in the root folder containing password that used to encrypt values before.

```bash
ansible-playbook -i inventories/development/host.yml playbooks/install-default.yml --vault-password-file ./vault_pass.txt
```