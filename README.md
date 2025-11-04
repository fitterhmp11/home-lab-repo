# README

## Purpose
This repository contains my Containerlab-based network automation lab.
The goal is to practice modern networking, automation workflows, and CI/CD concepts in an enclosed environment as well as grow in understanding of key networking concepts.


## Key Commands
- Deploy a lab topology

    `clab deploy -t containerlab/cx_basic_lab/topology.yml`

- Destroy the lab

    `clab destroy -t containerlab/cx_basic_lab/topology.yml`

- Run an Ansible playbook 
    
    `ansible-playbook ansible/ping-test.yml -i ansible/inventory.yml`



## Directory Structure with explanations
```
home-lab-repo/
├── ansible/   # Playbooks, roles, and inventories for network automation.
├── configs/        # Device configurations organized by vendor or lab.
├── containerlab/   # Containerlab topology files and related artifacts.
├── docs/           # Documentation, notes, and network diagrams.
├── observability/  # Monitoring/observability stack configs (Grafana, Prometheus, etc.).
├── automation/     # Source-of-truth and automation tools (NetBox, Oxidized, etc.).
├── scripts/        # Helper scripts in Bash, Python, or other languages.
├── tests/          # Testing and validation code for labs or automation workflows.
├── tools/          # Utility containers or lightweight lab host setups (e.g., Alpine).
├── secrets/        # Sensitive files (vaults, API keys, SSH keys) excluded from Git.
├── .gitignore      # Defines which files/folders Git should ignore.
└── README.md       # Top-level documentation about the repo’s purpose and usage.
```
### ansible directory structure with explanations

ansible/
├── ansible.cfg
├── inventories/
│   ├── lab/
│   │   ├── hosts.yml
│   │   └── group_vars/
│   │       └── all.yml
├── roles/
├── playbooks/
│   └── backup.yml     ← first playbook
├── collections/
└── vault/
    └── secrets.yml


## Progress Log

2025-11-04: testing with ansible to get playbook for both connection types, network_cli and APIREST (now pyaoscx framework).  Updated the playbooks and files repo, adding a few comments.  Then updated my dockerfile and docker-compose so ansible will have needed ubuntu and pythone packages.  rebuilt it and ran it, it connected automatically and the playbook I tested still works.  Updated the arubacx-and-host topology file to install some tools to linux host.  tested with tcpdump

2025-11-03: Setup the github repo.  configured correct .gitignore and ssh key info on the local.  then pushed to github


2025-10-28: connected scp-server and ansible container clab network.  Setup inventory(host) file for arubacx_and_host lab.  modified the ansible cfg file.  Created playbook to take back of running config.  Issues with chatgpt collection names, and needed additional python dependancies to run the playbook using ssh (needed paramiko and another library).  The aruba cx offical documentation uses the API calls, GPT was giving me playbooks using the network_cli connection.  fixed the host file and the playbooks to have correct syntex, disabled auhtorized key authentication in favor of admin/password and was able get a working playbook called "backup_cx_config" that save the output of the show running configuration to a string variable, then writes it to mounted directory on host.

2025-10-27:Installed containerlab vscode extesion and tested running clab and connecting to nodes directly from vscode
used chatgpt to step me through setting up ansible as container on host.  Confirmed container could run and ansible version was correct.  Setup ansible directories, created ansible.cfg and requirements.yml file and installed the arubaos collections
2025-10-20: Setup scp-server and can copy to/from configs from the aoscx nodes in containerlab



## References

	•	Containerlab Documentation [https://containerlab.dev/]